import 'package:flutter/material.dart' hide NavigationDrawer;
import 'package:flutter_project/views/navigation_drawer.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';
import 'package:get/get.dart';

import '../widgets/icon_menu_item.dart';
import 'bottom_navigation_helper.dart';
import 'entries/entries.dart';
import 'navigation_drawer.dart';
import '../controllers/NotificationsController.dart';
import '../models/notification.dart' as notif;


class MyNotifications extends GetView<NotificationsController> {
  MyNotifications({Key? key}) : super(key: key);

  final NotificationsController controller = Get.find<NotificationsController>();


  @override
  Widget build(BuildContext context) {
    //final controller = Get.find<NotificationsController>();

    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.white),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
           Expanded(
            child: GetX<NotificationsController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.notificationCards.length,
                  itemBuilder: (context, index) {
                    final notification = controller.notificationCards[index];
                    return IconMenuItem(
                      icon: Icons.workspaces_outlined,
                      title: notification.title,
                      row1: notification.subtitle,
                      onTap: () {
                        // Handle notification onTap
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: createHomeBottomNavigationBar(1),
    );
  }
}
