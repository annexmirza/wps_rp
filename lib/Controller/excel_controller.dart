import 'dart:io';

import 'package:excel/excel.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class ExcelController extends GetxController {
  var excel = Excel.createExcel();

  File? excelFile;

  bool showExcel = false;

  creatingExcelSheet() async {
    Sheet excelSheetObject = excel['sheet 1'];

    // excel.encode().then((onValue) {

    //     File(join("Path_to_destination/excel.xlsx"))
    //     ..createSync(recursive: true)
    //     ..writeAsBytesSync(onValue);
    // });

//geting phone directory
    final dir = await getApplicationDocumentsDirectory();
    final file =
        File('${dir.path}/excel.xlsx'); //defing path where excel to be saved
    excelFile = file;
    update();
    var excelEncode = excel.encode(); //encoding excel to bytes list

//saving excel
    try {
      file
        ..createSync(recursive: true)
        ..writeAsBytesSync(excelEncode!);

      return Get.snackbar('Successfulll', 'excel saved');
    } catch (e) {
      return Get.snackbar('Failed', 'Error : $e');
    }

    ///opening the created excel sheet
  }

  openingExcel() {
    showExcel = true;
    update();
    //OpenFile.open(excelFile!.path);
  }
}
