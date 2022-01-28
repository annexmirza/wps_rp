import 'dart:io';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class PdfSignatureController extends GetxController {
  final signaturePadKey = GlobalKey<SfSignaturePadState>();

  PdfDocument document = PdfDocument();

  bool showSignaturePad = false;

  var imageBitmap;
  hidingSignaturePad() {
    showSignaturePad = true;
    update();
  }

  submitingSignature() async {
    final image = await signaturePadKey.currentState!.toImage();
    final signatureImage = await image.toByteData(format: ImageByteFormat.png);
    imageBitmap = PdfBitmap(signatureImage!.buffer.asUint8List());
    update();
    hidingSignaturePad();
  }

  loadingPdf() async {
    ///picking files
    ///
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      try {
        document = PdfDocument(inputBytes: File(file.path).readAsBytesSync());
        update();
        print('pdf loaded successfully');
      } catch (e) {
        print('error while loading pdf: $e');
      }
    } else {
      // User canceled the picker
    }

    //Get the existing PDF page.
    final PdfPage page = document.pages[0];

//Draw text in the PDF page.

    final pageSize = page.getClientSize();

    try {
      ///add signature
      ///
      ///
      ///
      page.graphics.drawImage(imageBitmap,
          Rect.fromLTWH(pageSize.width - 250, pageSize.height - 150, 200, 100));

      print('signature added');

      // page.graphics.drawString(
      //     'Hello World!', PdfStandardFont(PdfFontFamily.helvetica, 12),
      //     brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      //     bounds: Rect.fromLTWH(0, 0, 150, 20));
      update();
    } catch (e) {
      print('error in signature adding : $e');
    }

//Save the document in app document directory
    try {
      Directory? appdir = await getExternalStorageDirectory();
      File('${appdir!.path}/output.pdf').writeAsBytes(document.save());

      print('file saved at : ${appdir.path}/output.pdf');
    } catch (e) {
      print('error while saving output : $e');
    }

//Dispose the document.
    document.dispose();
  }
}
