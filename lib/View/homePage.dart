import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
        appBar: AppBar(
          title: Text("Name Shahid"),
          actions: [
            Icon(Icons.search_outlined),
            Icon(Icons.menu),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: Get.height,
            child: Column(
              children: [
                Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25.h,
                        ),
                        Row(
                          children: [
                            CustomButtonWithText(
                              buttonIcon: Icons.directions_bike,
                              titleText: ("File Manager"),
                              onTab: () {},
                            ),
                            SizedBox(
                              width: 5.h,
                            ),
                            CustomButtonWithText(
                              buttonIcon: Icons.directions_bike,
                              titleText: ("Recived"),
                              onTab: () {},
                            ),
                            SizedBox(
                              width: 5.h,
                            ),
                            CustomButtonWithText(
                              buttonIcon: Icons.directions_bike,
                              titleText: ("Transfer"),
                              onTab: () {},
                            ),
                            SizedBox(
                              width: 5.h,
                            ),
                            CustomButtonWithText(
                              buttonIcon: Icons.directions_bike,
                              titleText: ("PDF Edit"),
                              onTab: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Row(
                          children: [
                            CustomButtonWithText(
                              buttonIcon: Icons.directions_bike,
                              titleText: ("PDF to DOC"),
                              onTab: () {},
                            ),
                            SizedBox(
                              width: 5.h,
                            ),
                            CustomButtonWithText(
                              buttonIcon: Icons.directions_bike,
                              titleText: ("Document\n Translation"),
                              onTab: () {},
                            ),
                            SizedBox(
                              width: 5.h,
                            ),
                            CustomButtonWithText(
                              buttonIcon: Icons.directions_bike,
                              titleText: ("PPT Recorder"),
                              onTab: () {},
                            ),
                            SizedBox(
                              width: 5.h,
                            ),
                            CustomButtonWithText(
                              buttonIcon: Icons.directions_bike,
                              titleText: ("File Manager"),
                              onTab: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
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
                        SizedBox(
                          height: 25.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                SizedBox(
                  height: 50,
                  child: AppBar(
                    bottom: TabBar(
                      tabs: [
                        Tab(
                          text: " Recent",
                        ),
                        Tab(
                          text: "Share",
                        ),
                        Tab(
                          text: "Starred",
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      // first tab bar view widget
                      Container(
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            'Bike',
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            'Bike',
                          ),
                        ),
                      ),

                      // second tab bar viiew widget
                      Container(
                        color: Colors.pink,
                        child: Center(
                          child: Text(
                            'Car',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonWithText extends StatelessWidget {
  String? titleText;
  IconData? buttonIcon;
  Function()? onTab;
  CustomButtonWithText({
    this.titleText,
    this.buttonIcon,
    this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab!,
      child: Container(
        child: Column(
          children: [
            Icon(buttonIcon),
            Text(
              titleText!,
              style: TextStyle(fontSize: 15.sp),
            ),
          ],
        ),
        color: Colors.amber,
      ),
    );
  }
}
