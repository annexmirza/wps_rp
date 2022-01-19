import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wps_rp/Widget/CustomFileCard.dart';
import 'package:wps_rp/Widget/custom_tile.dart';

class FilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(" Open File "),
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: Get.height,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTile(),
              CustomTile(),
              CustomTile(),
              CustomTile(),
              SizedBox(
                height: 30.h,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      CustomFileCard(),
                      Spacer(),
                      CustomFileCard(),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  CustomFileCard(),
                  Spacer(),
                  CustomFileCard(),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  CustomFileCard(),
                  Spacer(),
                  CustomFileCard(),
                ],
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
