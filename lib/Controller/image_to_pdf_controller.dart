import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:get/get.dart';

class ImageToPdfController extends GetxController {
  File? imageFile;
  final picker = ImagePicker();
  final pdf = pw.Document();

  gettingImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (picker != null) {
      imageFile = File(pickedFile!.path);
      update();
    } else {
      print('Unable to select image from gallery');
    }
  }

  gettingImageFromCamera() {}

  creatingPdf() async {
    final image = pw.MemoryImage(imageFile!.readAsBytesSync());

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Image(image),
          );
        },
      ),
    );
  }

  savingPdf() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/filename.pdf');
      await file.writeAsBytes(await pdf.save());
      return Get.defaultDialog(title: 'pdf saved as filename.pdf');
    } catch (e) {
      return Get.defaultDialog(title: 'pdf not saved error: $e');
    }
  }
}
