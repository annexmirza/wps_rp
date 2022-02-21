import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
class ResumeController extends GetxController{
  
   createPdf() async{
    final pdf = pw.Document();
var total=0;
    pdf.addPage(
      pw.Page(
        
       pageFormat: PdfPageFormat.a4.applyMargin(left:5, top:5, right:5, bottom:5),
        build: (context) => pw.Container (
        
          
          child:pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
          pw.Container(
            height: 40,
            width: Get.width,
            child: pw.Center(
                child: pw.Text('Hasnain',
                    style: pw.TextStyle(color: PdfColor.fromHex('#000'),fontSize: 20.0,fontWeight: pw.FontWeight.bold)),
          ),),
          pw.SizedBox(height: 20),
pw.Text('Address: '
),
  pw.Text('Email: '
),
pw.Text('Phone: '
),        
   pw.SizedBox(height: 20),
   pw.Text('Objectives:',style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 16),
), 
   pw.SizedBox(height: 10),
   pw.Text('''pdateRequestedVisibility, mViewVisibility:true, mWindowVisibility:false, mWindowStopped:true by android.view.SurfaceView.windowStopped:266 android.view.ViewRootImpl.setWindowStopped:1763 android.view.WindowManagerGlobal.setStoppedState:687 android.app.Activity.performStop:8209 android.app.ActivityThread.callActivityOnStop:4939 android.app.ActivityThread.performStopActivityInner:4917 android.app.ActivityThread.handleStopActivity:4999 android.app.servertransaction.StopActivityItem.execute:41
I/SurfaceView( 7080): 30688930  updateSurface this = io.flutter.embedding.android.FlutterSurfaceView{1d446a2 V.E...... ........ 0,0-720,1512}  surface.isValid = false'''),
   pw.SizedBox(height: 20),
   pw.Text('Education:',style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 16),
   
),
pw.SizedBox(height: 10),

pw.Row(
  mainAxisAlignment: pw.MainAxisAlignment.start,
  children: [
   pw.Text('1.'
), 
  pw.Text(' School Name'
), 
]),

        ])),
      ),
    );


   Directory appDocDir = await getApplicationDocumentsDirectory();
    final targetPath = '/document';
    final targetFileName = "example-pdf";
  if(await Permission.storage.request().isGranted){
     String _localPath = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
        final file=File('${_localPath}/example.pdf');
    final generatedPdfFile = await file.writeAsBytes(await pdf.save());
   
    print(generatedPdfFile);
  }}
}