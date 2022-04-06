import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wps_rp/Controller/conversion_controller.dart';
import 'package:wps_rp/View/homePage.dart';

class ConversionScreen extends StatelessWidget {
  ConversionScreen({Key? key}) : super(key: key);
  ConversionController conversionController = Get.put(ConversionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: 50.sp,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButtonWithText(
                titleText: 'Docx TO JPG',
                onTab: () {
                  conversionController.convertDocxToJpg();
                },
              ),
              SizedBox(
                width: 10.w,
              ),
              CustomButtonWithText(
                titleText: 'Docx TO PDF',
                onTab: () {
                  conversionController.convertDocxToPdf();
                },
              ),
              SizedBox(
                width: 10.w,
              ),
              CustomButtonWithText(
                titleText: 'PDFTO JPG',
                onTab: () {
                  conversionController.convertPdfToJpg();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
