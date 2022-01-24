import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:wps_rp/Controller/pdf_signature_controller.dart';

class PdfSignaturePage extends StatelessWidget {
  PdfSignaturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PdfSignatureController>(
        init: PdfSignatureController(),
        builder: (pdfSignatureController) {
          return Container(
              child: pdfSignatureController.showSignaturePad
                  ? InkWell(
                      onTap: () async {
                        await pdfSignatureController.loadingPdf();
                        Get.snackbar('successfull', 'mission complete');

                        //   pdfSignatureController.hidingSignaturePad();
                      },
                      child: Center(
                        child: Text('Load pdf editing'),
                      ),
                    )
                  : Column(
                      children: [
                        Container(
                          height: Get.height / 1.2,
                          child: SfSignaturePad(
                            key: pdfSignatureController.signaturePadKey,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            //add signature to pdf functiuon
                            await pdfSignatureController.submitingSignature();
                          },
                          child: Text('Add signature'),
                        ),
                      ],
                    ));
        });
  }
}
