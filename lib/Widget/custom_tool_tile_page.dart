import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wps_rp/View/homePage.dart';

class CustomToolsTile extends StatelessWidget {
  String? titleText;
  CustomToolsTile({this.titleText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 120.h,
          width: Get.width,
          color: Colors.purple,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.0.w, right: 12.0.w, top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(titleText!),
                    Spacer(),
                    InkWell(
                        onTap: () {},
                        child: Container(
                          child: Text("More"),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButtonWithText(
                      buttonIcon: Icons.directions_bike,
                      titleText: ("Export \nimages"),
                      onTab: () {},
                    ),
                    CustomButtonWithText(
                      buttonIcon: Icons.directions_bike,
                      titleText: ("Export \nimages"),
                      onTab: () {},
                    ),
                    CustomButtonWithText(
                      buttonIcon: Icons.directions_bike,
                      titleText: ("Export \nimages"),
                      onTab: () {},
                    ),
                    CustomButtonWithText(
                      buttonIcon: Icons.directions_bike,
                      titleText: ("Export \nimages"),
                      onTab: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
