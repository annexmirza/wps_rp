import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:wps_rp/Controller/pdf_controller.dart';

class PdfViewScreen extends StatelessWidget {
  const PdfViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PdfFileController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Pdf'),
        ),
        body: Container(
          child: PdfView(controller: controller.pdfController),
        ),
      );
    });
  }
}
