import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wps_rp/View/file_page.dart';
import 'package:wps_rp/View/homePage.dart';

class BottomNavController extends GetxController {
  // @override
  //   onInit(){
  //   _topicController.getTopics();
  //   super.onInit();
  // }

  //TopicController _topicController = Get.put(TopicController());

  int currentIndex = 0;
  /* --------------------------------- bottomAppBar --------------------------------- */
  List allPagesScreen = [
    HomePage(),
    FilePage(),
    Container(
      height: Get.height,
      width: Get.width,
      child: Text(" Page 3"),
      color: Colors.purpleAccent,
    ),
    Container(
      height: Get.height,
      width: Get.width,
      child: Text(" Page 4"),
      color: Colors.blueGrey,
    )
    // HomePageScreen(),
    // SearchPage(),
    // AboutPage(),
    // ChatsPage()
    //  ProfilePage(),

    // OverViewPage(),
    // StoryPage(),activi
    // HacksDetailsPage()

    // AboutPage()
    // OverViewPage()
  ];

  updatePage(index) {
    index = allPagesScreen[currentIndex];
    update();
  }
}
