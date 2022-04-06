import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wps_rp/Controller/conversion_controller.dart';
import 'package:wps_rp/View/homePage.dart';

// ignore: must_be_immutable
class ConversionScreen extends StatelessWidget {
  //  ConversionScreen({ Key? key }) : super(key: key);
ConversionController conversionController=Get.put(ConversionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          height: 50.sp,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                    InkWell(
              onTap: () {
                conversionController.convertDocxToJpg();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blue,
                ),
                width: 200.w,
                child: Text('PDF to JPG',style: TextStyle(color: Colors.white),),
                
              ),
            ),
              SizedBox(width: 10.w,),
        
                 SizedBox(width: 10.w,),
            InkWell(
              onTap: () {
                conversionController.convertPdfToJpg();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blue,
                ),
                width: 200.w,
                child: Text('PDF to JPG',style: TextStyle(color: Colors.white),),
                
              ),
            ),
            ],
            
          ),
        ),
      ),
    );
  }
}