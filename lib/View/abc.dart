import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:get/get.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wps_rp/Controller/pdf_controller.dart';



  
class resume extends StatelessWidget {
   resume({ Key? key }) : super(key: key);

 PdfFileController pdfFileController=Get.put(PdfFileController());
  @override
  Widget build(BuildContext context) {
    // generateExampleDocument();
// pdfFileController.generateExampleDocument();

     return GetBuilder<PdfFileController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Pdf'),
        ),
        body: Container(
          child: WebView(
       initialUrl: 'ps://www.ilovepdf.com/pdf_to_wordhtt',
     )
        ),
      );});
    
  }
}