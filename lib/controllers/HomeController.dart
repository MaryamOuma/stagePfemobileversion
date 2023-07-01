import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/login/Profile.dart';
import '../views/notifications.dart';
import '../views/settings.dart';

class HomeController extends GetxController {
  int currentIndex = 0;

  final List<Widget> pages = [
    Container(),
    MyNotifications(),
    Settings(),
    Profile(),
  ];

  void onTabTapped(int index) {
    if (index != currentIndex) {
      currentIndex = index;
      update();
    }
  }

  void navigateToPage(int index) {
    // Handle navigation using GetX
    if (index == 0) {
      // Notifications icon tapped
      // Do nothing or handle the specific behavior for notifications page
    } else {
      // Other icons tapped
      Get.to(() => pages[index]);
    }
  }
}
