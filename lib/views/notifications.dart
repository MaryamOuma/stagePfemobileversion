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


class MyNotifications extends StatelessWidget {
  MyNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final controller = Get.find<NotificationsController>();
    // Get the existing instance of the NotificationController
    NotificationController controller = Get.put(NotificationController());

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
            child: Obx(() {
              final data = controller.notificationData.value;
              if (data.notifications == null) {
                // Data is not yet available, show loading indicator
                return Center(child: CircularProgressIndicator());
              } else if (data.notifications == 0) {
                // No notifications available, display a message
                return Center(child: CircularProgressIndicator());
              } else {
                // Display the ListView with data
                return ListView(
                  children: [
                    if (data.commandsNumber != null && data.commandsNumber! > 0)
                      IconMenuItem(
                        icon: Icons.workspaces_outlined,
                        title: 'Commands'.tr,
                        row1:
                            'You have ${data.commandsNumber} entries commands to treat'
                                .tr,
                        onTap: () {
                          // ... Your onTap logic ...
                        },
                      ),
                    if (data.invoicesToValidate != null &&
                        data.invoicesToValidate! > 0)
                      IconMenuItem(
                        icon: Icons.receipt_outlined,
                        title: 'Invoices'.tr,
                        row1:
                            'You have ${data.invoicesToValidate} invoices to validate'
                                .tr,
                        onTap: () {
                          // ... Your onTap logic ...
                        },
                      ),
                    if (data.exitinvoicesTopay != null &&
                        data.exitinvoicesTopay! > 0)
                      IconMenuItem(
                        icon: Icons.receipt_outlined,
                        title: 'Invoices'.tr,
                        row1:
                            'You have ${data.exitinvoicesTopay} exit invoices to pay'
                                .tr,
                        onTap: () {
                          // ... Your onTap logic ...
                        },
                      ),
                    if (data.exitInvoicesToValidate != null &&
                        data.exitInvoicesToValidate! > 0)
                      IconMenuItem(
                        icon: Icons.receipt_outlined,
                        title: 'Invoices'.tr,
                        row1:
                            'You have ${data.exitInvoicesToValidate} exit invoices to validate'
                                .tr,
                        onTap: () {
                          // ... Your onTap logic ...
                        },
                      ),
                    if (data.expirationArticles != null &&
                        data.expirationArticles! > 0)
                      IconMenuItem(
                        icon: Icons.article,
                        title: 'Articles'.tr,
                        row1:
                            'You have ${data.expirationArticles} expired articles'
                                .tr,
                        onTap: () {
                          // ... Your onTap logic ...
                        },
                      ),
                    if (data.thresholdArticles != null &&
                        data.thresholdArticles! > 0)
                      IconMenuItem(
                        icon: Icons.article,
                        title: 'Articles'.tr,
                        row1:
                            'You have ${data.thresholdArticles} articles that reached threshold'
                                .tr,
                        onTap: () {
                          // ... Your onTap logic ...
                        },
                      ),
                    if (data.invoicesTopay != null && data.invoicesTopay! > 0)
                      IconMenuItem(
                        icon: Icons.receipt_outlined,
                        title: 'Invoices'.tr,
                        row1:
                            'You have ${data.invoicesTopay} invoices to pay'.tr,
                        onTap: () {
                          // ... Your onTap logic ...
                        },
                      ),
                    if (data.clientscommandsNumber != null &&
                        data.clientscommandsNumber! > 0)
                      IconMenuItem(
                        icon: Icons.workspaces_outlined,
                        title: 'Commands'.tr,
                        row1:
                            'You have ${data.clientscommandsNumber} exit commands To treat'
                                .tr,
                        onTap: () {
                          // ... Your onTap logic ...
                        },
                      ),
                    if (data.myclientsRejectedCommandsNumber != null &&
                        data.myclientsRejectedCommandsNumber! > 0)
                      IconMenuItem(
                        icon: Icons.workspaces_outlined,
                        title: 'Commands'.tr,
                        row1:
                            'You have ${data.myclientsRejectedCommandsNumber} exit rejected commands'
                                .tr,
                        onTap: () {
                          // ... Your onTap logic ...
                        },
                      ),
                    if (data.myRejectedCommandsNumber != null &&
                        data.myRejectedCommandsNumber! > 0)
                      IconMenuItem(
                        icon: Icons.workspaces_outlined,
                        title: 'Commands'.tr,
                        row1:
                            'You have ${data.myRejectedCommandsNumber} entries rejected commands'
                                .tr,
                        onTap: () {
                          // ... Your onTap logic ...
                        },
                      ),
                  ],
                );
              }
            }),
          ),
        ],
      ),
      bottomNavigationBar: createHomeBottomNavigationBar(1),
    );
  }
}
