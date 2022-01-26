import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wps_rp/Controller/pdf_controller.dart';
import 'package:wps_rp/Controller/qr_scanner_controller.dart';
import 'package:wps_rp/View/image_to_pdf_page.dart';
import 'package:wps_rp/View/pdf_signature_page.dart';
import 'package:wps_rp/View/pdf_view_screen.dart';
import 'package:wps_rp/View/qr_scanner.dart';

class HomePage extends StatelessWidget {
  PdfFileController pdfFileController = Get.put(PdfFileController());
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
                        ////first row ////////
                        ///
                        ///
                        Row(
                          children: [
                            CustomButtonWithText(
                              buttonIcon: Icons.directions_bike,
                              titleText: ("Open Pdf"),
                              onTab: () async {
                                await pdfFileController.OpenDocumentReader();
                                Get.to(PdfViewScreen());
                              },
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

                        ///Second row /////////
                        ///
                        ///
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

                        ///Third Row
                        ///
                        ///

                        Container(
                          width: Get.width,
                          child: Row(
                            children: [
                              CustomButtonWithText(
                                buttonIcon: Icons.directions_bike,
                                titleText: ("QR Scanner"),
                                onTab: () {
                                  Get.to(() => QRScannerPage());
                                },
                              ),
                              SizedBox(
                                width: 5.h,
                              ),
                              CustomButtonWithText(
                                buttonIcon: Icons.directions_bike,
                                titleText: ("Image to Pdf"),
                                onTab: () {
                                  Get.to(
                                    () => ImageToPdfPage(),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 5.h,
                              ),
                              CustomButtonWithText(
                                buttonIcon: Icons.directions_bike,
                                titleText: ("Sign Pdf"),
                                onTab: () {
                                  Get.to(() => PdfSignaturePage());
                                },
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
