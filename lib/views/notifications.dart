import 'package:flutter/material.dart' hide NavigationDrawer;
import 'package:flutter_project/views/entries/commands.dart';
import 'package:flutter_project/views/navigation_drawer.dart';
import '../widgets/icon_menu_item.dart';
import 'bottom_navigation_helper.dart';
import 'entries/commands.dart';
import 'entries/entries.dart';
import 'navigation_drawer.dart';
import 'package:get/get.dart';
import '../controllers/NotificationsController.dart';
import '../models/notification.dart' as notif;
import 'package:stacked_notification_cards/stacked_notification_cards.dart';

class MyNotifications extends GetView<NotificationsController> {
  MyNotifications({Key? key}) : super(key: key);

  final NotificationsController controller = Get.put(NotificationsController());

  final Map<String, Widget> leadingWidgets = {
    'widget1': Icon(Icons.notification_important),
    'widget2': Image.asset('assets/images/notification_icon.png'),
    // Add more mappings as needed
  };

  @override
  Widget build(BuildContext context) {
    //final controller = Get.find<NotificationsController>();

    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: controller.notificationCards.length,
          itemBuilder: (context, index) {
            final notification = controller.notificationCards[index];
            final leadingWidget = leadingWidgets[notification.leading];

            return ListTile(
              leading: leadingWidget,
              title: Text(notification.title),
              subtitle: Text(notification.subtitle),
              trailing: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () => controller.clearNotification(index),
              ),
              onTap: () => controller.viewNotification(index),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final notification = notif.NotificationCard(
            date: DateTime.now(),
            leading: 'widget1', // Set the appropriate identifier for the leading widget
            title: 'New Notification',
            subtitle: 'This is a new notification.',
          );
          controller.addNotification(notification);
        },
      ),
    );
  }
}