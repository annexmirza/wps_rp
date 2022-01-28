import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:pdf_text/pdf_text.dart';

class PdfToDocController extends GetxController {
  PDFDoc? _pdfDoc;
  String text = "";

  bool buttonsEnabled = true;

  Future pickPDFText() async {
    var filePickerResult = await FilePicker.platform.pickFiles();
    if (filePickerResult != null) {
      _pdfDoc = await PDFDoc.fromPath(filePickerResult.files.single.path!);
    }
    readWholeDoc();
  }

  /// Reads a random page of the document
  Future readRandomPage() async {
    if (_pdfDoc == null) {
      return;
    }

    buttonsEnabled = false;

    String text =
        await _pdfDoc!.pageAt(Random().nextInt(_pdfDoc!.length) + 1).text;

    text = text;
    buttonsEnabled = true;
  }

  /// Reads the whole document
  Future readWholeDoc() async {
    if (_pdfDoc == null) {
      return;
    }

    buttonsEnabled = false;

    String text = await _pdfDoc!.text;
    print('pdf reader ' + text);
    text = text;
    buttonsEnabled = true;
  }
}
