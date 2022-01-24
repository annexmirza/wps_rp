import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wps_rp/View/bottom_Nav_Bar_Page.dart';
import 'package:wps_rp/View/excel_page.dart';
import 'package:wps_rp/View/homePage.dart';
import 'package:wps_rp/View/image_to_pdf_page.dart';
import 'package:wps_rp/View/pdf_signature_page.dart';
import 'package:wps_rp/View/qr_scanner.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //     // options: DefaultFirebaseOptions.currentPlatform
  //     );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              builder: EasyLoading.init(),
              home: landingPage(),
            ));
  }
}

Widget landingPage() {
  return BottomNavBarPage();
}
