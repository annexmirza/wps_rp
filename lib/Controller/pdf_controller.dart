import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class PdfFileController extends GetxController {
  var pdfController;
  Future OpenDocumentReader() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, allowCompression: true);
    pdfController = PdfController(
        document: PdfDocument.openFile(result!.files.single.path!));
    update();
  }
}