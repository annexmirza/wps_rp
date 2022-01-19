import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wps_rp/Widget/CustomFileCard.dart';
import 'package:wps_rp/Widget/custom_tile.dart';
import 'package:wps_rp/Widget/custom_tool_tile_page.dart';

import 'homePage.dart';

class ToolsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text("Tool"),
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: Get.height,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomToolsTile(
                titleText: "PDF TOOL",
              ),
              CustomToolsTile(
                titleText: "Image Scanner",
              ),
              CustomToolsTile(
                titleText: "Document Processsor",
              ),
              CustomToolsTile(
                titleText: " School Tools",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
