import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text("ME"),
      ),
      body: Container(
        height: Get.height,
        child: Column(
          children: [
            Container(
              height: 300.h,
              width: 300.w,
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40.r,
                        backgroundColor: Colors.red,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text("Shahid Mirza")
                      
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
