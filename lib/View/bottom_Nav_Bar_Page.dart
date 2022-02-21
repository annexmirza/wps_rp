import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:wps_rp/Controller/Bottom_Nav_Controller.dart';

class BottomNavBarPage extends StatelessWidget {
  final BottomNavController bottomNavController =
      Get.put(BottomNavController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(builder: (bottomNavController) {
      return Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Container(
          child: bottomNavController
              .allPagesScreen[bottomNavController.currentIndex],
        ),

        //  allPageScreen[currentPage]

        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 0.w, right: 0.h, bottom: 0.h),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0.r),
              // color: Colors.white,
            ),
            child: GNav(
              padding: EdgeInsets.only(
                  left: 24.w, right: 15.w, top: 18.h, bottom: 18.h),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              tabBackgroundColor: Color(0xffFFC41F),
              onTabChange: (index) {
                bottomNavController.currentIndex = index;
                bottomNavController.updatePage(index);
              },
              selectedIndex: bottomNavController.currentIndex,
              // iconSize: 25,
              tabs: [
                GButton(
                  icon: Icons.home_filled,
                ),
                GButton(
                  icon: Icons.access_alarms_sharp,
                ),
                GButton(icon: Icons.person),
                GButton(
                  icon: Icons.youtube_searched_for_outlined,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
