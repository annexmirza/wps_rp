import 'package:flutter/material.dart';
import 'package:flutter_filereader/flutter_filereader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wps_rp/Controller/excel_controller.dart';

class ExcelPage extends StatelessWidget {
  const ExcelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExcelController>(
        init: ExcelController(),
        builder: (excelController) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Create Excel'),
            ),
            body: excelController.showExcel
                ? Center(
                    child: FileReaderView(filePath: 'assets/excel420.xlsx'

                        //excelController.excelFile!.path,
                        ),
                  )
                : Container(
                    color: Colors.green[200],
                    child: Center(
                      child: excelController.excelFile != null
                          ? InkWell(
                              onTap: () async {
                                await excelController.openingExcel();
                              },
                              child: Container(
                                width: 150.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.r),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Open excel',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () async {
                                await excelController.creatingExcelSheet();
                              },
                              child: Container(
                                width: 150.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.r),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Create excel',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
          );
        });
  }
}
