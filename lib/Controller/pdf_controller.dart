// import 'dart:html';
import 'dart:io';

// import 'package:ext_storage/ext_storage.dart';
import 'package:external_path/external_path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
// import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_compressor/pdf_compressor.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:aspose_words_cloud/aspose_words_cloud.dart';
import 'dart:convert';
import 'dart:io';


class PdfFileController extends GetxController {
  // Configure words api client

  var pdfController;
  String generated='';
  Future OpenDocumentReader() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        allowCompression: true,
        allowedExtensions: ['pdf']);
    pdfController = PdfController(
        document: PdfDocument.openFile(result!.files.single.path!));
    update();
  }
  Future<void> generateExampleDocument() async {
    final htmlContent = """
    <!DOCTYPE html>
    <html>
      <head>
        <style>
      /#sidebar{position:absolute;top:0;left:0;bottom:0;width:250px;padding:0;margin:0;overflow:auto}#page-container{position:absolute;top:0;left:0;margin:0;padding:0;border:0}@media screen{#sidebar.opened+#page-container{left:250px}#page-container{bottom:0;right:0;overflow:auto}.loading-indicator{display:none}.loading-indicator.active{display:block;position:absolute;width:64px;height:64px;top:50%;left:50%;margin-top:-32px;margin-left:-32px}.loading-indicator img{position:absolute;top:0;left:0;bottom:0;right:0}}@media print{@page{margin:0}html{margin:0}body{margin:0;-webkit-print-color-adjust:exact}#sidebar{display:none}#page-container{width:auto;height:auto;overflow:visible;background-color:transparent}.d{display:none}}.pf{position:relative;background-color:white;overflow:hidden;margin:0;border:0}.pc{position:absolute;border:0;padding:0;margin:0;top:0;left:0;width:100%;height:100%;overflow:hidden;display:block;transform-origin:0 0;-ms-transform-origin:0 0;-webkit-transform-origin:0 0}.pc.opened{display:block}.bf{position:absolute;border:0;margin:0;top:0;bottom:0;width:100%;height:100%;-ms-user-select:none;-moz-user-select:none;-webkit-user-select:none;user-select:none}.bi{position:absolute;border:0;margin:0;-ms-user-select:none;-moz-user-select:none;-webkit-user-select:none;user-select:none}@media print{.pf{margin:0;box-shadow:none;page-break-after:always;page-break-inside:avoid}@-moz-document url-prefix(){.pf{overflow:visible;border:1px solid #fff}.pc{overflow:visible}}}.c{position:absolute;border:0;padding:0;margin:0;overflow:hidden;display:block}.t{position:absolute;white-space:pre;font-size:1px;transform-origin:0 100%;-ms-transform-origin:0 100%;-webkit-transform-origin:0 100%;unicode-bidi:bidi-override;-moz-font-feature-settings:"liga" 0}.t:after{content:''}.t:before{content:'';display:inline-block}.t span{position:relative;unicode-bidi:bidi-override}._{display:inline-block;color:transparent;z-index:-1}::selection{background:rgba(127,255,255,0.4)}::-moz-selection{background:rgba(127,255,255,0.4)}.pi{display:none}.d{position:absolute;transform-origin:0 100%;-ms-transform-origin:0 100%;-webkit-transform-origin:0 100%}.it{border:0;background-color:rgba(255,255,255,0.0)}.ir:hover{cursor:pointer}
        </style>
      </head>
      <body>
        <h2>PDF Generated with flutter_html_to_pdf plugin</h2>
        
        <table style="width:100%">
          <caption>Sample HTML Table</caption>
          <tr>
            <th>Month</th>
            <th>Savings</th>
          </tr>
          <tr>
            <td>January</td>
            <td>100</td>
          </tr>
          <tr>
            <td>February</td>
            <td>50</td>
          </tr>
        </table>
        
        <p>Image loaded from web</p>
        <img src="https://i.imgur.com/wxaJsXF.png" alt="web-img">
      </body>
    </html>
    """;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    final targetPath = '/document';
    final targetFileName = "example-pdf";
  if(await Permission.storage.request().isGranted){
     String _localPath = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
    final generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(htmlContent, _localPath, targetFileName);
    print('hello'+ generatedPdfFile.path);
 generated = generatedPdfFile.path;}
update();
  }
  
compressFile() async{
  String _localPath = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
   try{
         FilePickerResult? result = await FilePicker.platform.pickFiles(
           dialogTitle: 'pick file to compress',
        type: FileType.custom,
        allowMultiple: false,
        allowCompression: true,
        allowedExtensions: ['pdf']);
     
   await PdfCompressor.compressPdfFile('${result!.paths[0]}', '${_localPath}/${result.names[0]}', CompressQuality.HIGH);
var file=await File('${_localPath}/${result.names[0]}.pdf');
Get.snackbar('Compressed','File compressed ${result.files[0].size} KBS to ${await file.length()} KBS');
}

catch(e){
  Get.snackbar("Error", e.toString());
}
}

  }
