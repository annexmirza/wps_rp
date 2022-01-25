import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'homePage.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          
          actions: [Text("Setting")],
        ),
        body: Column(
          children: [
            Container(
              child: Text(" PDF to"),
            ),
            Container(
              width: Get.width,
              child: Row(
                children: [
                  CustomButtonWithText(
                    buttonIcon: Icons.directions_bike,
                    titleText: ("Export images"),
                    onTab: () {},
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  CustomButtonWithText(
                    buttonIcon: Icons.directions_bike,
                    titleText: ("School Tools"),
                    onTab: () {},
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  CustomButtonWithText(
                    buttonIcon: Icons.directions_bike,
                    titleText: ("Export to PDF"),
                    onTab: () {},
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  CustomButtonWithText(
                    buttonIcon: Icons.directions_bike,
                    titleText: ("More"),
                    onTab: () {},
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
