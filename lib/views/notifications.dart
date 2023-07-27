import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/notification_controller.dart';
import 'package:flutter_project/shared/theme.dart';
import 'package:flutter_project/views/navigation_drawer.dart';
import 'package:flutter_project/views/notifications/EntriesInvoicesToPay.dart';
import 'package:flutter_project/views/notifications/EntriesInvoicesToValidate.dart';
import 'package:flutter_project/views/notifications/ExitCommandsTotreat.dart';
import 'package:flutter_project/views/notifications/ExitsInvoicesToPay.dart';
import 'package:flutter_project/views/notifications/ExitsInvoicesToValidate.dart';
import 'package:flutter_project/views/notifications/ExpiredArticles.dart';
import 'package:flutter_project/views/notifications/RejectedEntriesCommands.dart';
import 'package:flutter_project/views/notifications/RejectedExitCommands.dart';
import 'package:flutter_project/views/notifications/ThresholdArticles.dart';
import '../widgets/icon_menu_item.dart';
import 'bottom_navigation_helper.dart';
import 'navigation_drawer.dart';
import 'package:get/get.dart';

import 'notifications/EntriesCommandsTotreat.dart';

class MyNotifications extends StatelessWidget {
  MyNotifications({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();

  bool isAnyItemClicked = false;
  bool isArticlesClicked = false;
  bool isExitCommandsTotreatClicked = false;
  bool isInvoicesClicked = false;
  // Define the map to store clicked status for each item
  Map<int, bool> clickedStatusMap = {};
  final RxBool showIconMenuItem = true.obs;

  @override
  Widget build(BuildContext context) {
    // Get the existing instance of the NotificationController
    NotificationController notifcontroller = Get.put(NotificationController());
    //int? viewedNotificationsCount =  notifcontroller.notificationData.value.notifications;
    void onSearchChanged() {
      // Perform search based on the entered query
      String query = searchController.text;
      notifcontroller.filterNotifications(query);
      print("on changed");
      // Implement search logic here
    }

    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: Text('notifications'.tr),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              colors: [
                Color(0xffE99E22),
                blue,
                grey,
              ],
            ),
          ),
        ),
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
            ),
          ),
          Expanded(
            child: Obx(() {
              final data = notifcontroller.notificationData.value;
              if (data.notifications == null) {
                // Data is not yet available, show loading indicator
                return Center(child: CircularProgressIndicator());
              } else if (data.notifications == 0) {
                // No notifications available, display a message
                return Center(
                    child: Text('You dont have any notifications yet!'));
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
                          itemId: 10,
                          onTap: () {
                            if (!clickedStatusMap.containsKey(10)) {
                              clickedStatusMap[10] = true;
                              notifcontroller.notificationData.refresh();
                              notifcontroller.decreaseNotificationCount(
                                  data.commandsNumber, 10);
                              notifcontroller.notificationData.refresh();

                              // Hide the IconMenuItem by updating the showIconMenuItem value
                              //notifcontroller.hideIconMenuItem();

                              Get.to(() => EntriesCommandsTotreat());
                            }
                          }),
                    if (data.invoicesToValidate != null &&
                        data.invoicesToValidate! > 0)
                      IconMenuItem(
                          icon: Icons.receipt_outlined,
                          title: 'Invoices'.tr,
                          row1:
                              'You have ${data.invoicesToValidate} invoices to validate'
                                  .tr,
                          itemId: 9, // Update this line
                          onTap: () {
                            if (!clickedStatusMap.containsKey(9)) {
                              clickedStatusMap[9] = true;
                              notifcontroller.notificationData.refresh();
                              notifcontroller.decreaseNotificationCount(
                                  data.invoicesToValidate, 9);
                              notifcontroller.notificationData.refresh();

                              // Hide the IconMenuItem by updating the showIconMenuItem value
                              //  notifcontroller.hideIconMenuItem();
                              Get.to(() => EntriesInvoicesToValidate());
                            }
                          }),
                    if (data.exitinvoicesTopay != null &&
                        data.exitinvoicesTopay! > 0)
                      IconMenuItem(
                          icon: Icons.receipt_outlined,
                          title: 'Invoices'.tr,
                          row1:
                              'You have ${data.exitinvoicesTopay} exit invoices to pay'
                                  .tr,
                          itemId: 8, // Update this line
                          onTap: () {
                            if (!clickedStatusMap.containsKey(8)) {
                              clickedStatusMap[8] = true;
                              notifcontroller.notificationData.refresh();
                              notifcontroller.decreaseNotificationCount(
                                  data.exitInvoicesToValidate, 8);
                              notifcontroller.notificationData.refresh();

                              // Hide the IconMenuItem by updating the showIconMenuItem value
                              // notifcontroller.hideIconMenuItem();
                              Get.to(() => ExitsInvoicesToPay());
                            }
                          }),
                    if (data.exitInvoicesToValidate != null &&
                        data.exitInvoicesToValidate! > 0)
                      IconMenuItem(
                          icon: Icons.receipt_outlined,
                          title: 'Invoices'.tr,
                          row1:
                              'You have ${data.exitInvoicesToValidate} exit invoices to validate'
                                  .tr,
                          itemId: 7, // Update this line
                          onTap: () {
                            if (!clickedStatusMap.containsKey(7)) {
                              clickedStatusMap[7] = true;
                              notifcontroller.notificationData.refresh();
                              notifcontroller.decreaseNotificationCount(
                                  data.exitInvoicesToValidate, 7);
                              notifcontroller.notificationData.refresh();

                              // Hide the IconMenuItem by updating the showIconMenuItem value
                              //notifcontroller.hideIconMenuItem();

                              Get.to(() => ExitsInvoicesToValidate());
                            }
                          }),
                    if (data.expirationArticles != null &&
                        data.expirationArticles! > 0)
                      Obx(() {
                        return Visibility(
                          visible: notifcontroller.showIconMenuItem.value,
                          child: IconMenuItem(
                            icon: Icons.article,
                            title: 'Articles'.tr,
                            row1:
                                'You have ${data.expirationArticles} expired articles'
                                    .tr,
                            itemId: 1,
                            onTap: () {
                              if (!clickedStatusMap.containsKey(1)) {
                                clickedStatusMap[1] = true;
                                notifcontroller.notificationData.refresh();
                                notifcontroller.decreaseNotificationCount(
                                    data.expirationArticles, 1);
                                notifcontroller.notificationData.refresh();

                                // Hide the IconMenuItem by updating the showIconMenuItem value
                                //notifcontroller.hideIconMenuItem();

                                Get.to(() => ExpiredArticles());
                              }
                            },
                          ),
                        );
                      }),
                    if (data.thresholdArticles != null &&
                        data.thresholdArticles! > 0)
                      IconMenuItem(
                        icon: Icons.article,
                        title: 'Articles'.tr,
                        row1:
                            'You have ${data.thresholdArticles} articles that reached threshold'
                                .tr,
                        itemId: 6,
                        onTap: () {
                          if (!clickedStatusMap.containsKey(6)) {
                            clickedStatusMap[6] = true;
                            notifcontroller.notificationData.refresh();
                            notifcontroller.decreaseNotificationCount(
                                data.thresholdArticles, 6);
                            notifcontroller.notificationData.refresh();

                            // Hide the IconMenuItem by updating the showIconMenuItem value
                            //notifcontroller.hideIconMenuItem();
                            Get.to(() => ThresholdArticles());
                          }
                        },
                      ),
                    if (data.invoicesTopay != null && data.invoicesTopay! > 0)
                      IconMenuItem(
                        icon: Icons.receipt_outlined,
                        title: 'Invoices'.tr,
                        row1:
                            'You have ${data.invoicesTopay} invoices to pay'.tr,

                        itemId: 5, // Update this line
                        onTap: () {
                          if (!clickedStatusMap.containsKey(5)) {
                            clickedStatusMap[5] = true;
                            notifcontroller.notificationData.refresh();
                            notifcontroller.decreaseNotificationCount(
                                data.invoicesTopay, 5);
                            notifcontroller.notificationData.refresh();

                            // Hide the IconMenuItem by updating the showIconMenuItem value
                            // notifcontroller.hideIconMenuItem();

                            Get.to(() => EntriesInvoicesTopay());
                          }
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
                        itemId: 2,
                        onTap: () {
                          if (!clickedStatusMap.containsKey(2)) {
                            clickedStatusMap[2] = true;
                            notifcontroller.notificationData.refresh();
                            notifcontroller.decreaseNotificationCount(
                                data.clientscommandsNumber, 2);
                            notifcontroller.notificationData.refresh();

                            // Hide the IconMenuItem by updating the showIconMenuItem value
                            //notifcontroller.hideIconMenuItem();

                            // Navigate to the home page
                            Get.to(() => ExitsCommandsTotreat());
                          }
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
                        itemId: 4,
                        onTap: () {
                          if (!clickedStatusMap.containsKey(4)) {
                            clickedStatusMap[4] = true;
                            notifcontroller.notificationData.refresh();
                            notifcontroller.decreaseNotificationCount(
                                data.myclientsRejectedCommandsNumber, 4);
                            notifcontroller.notificationData.refresh();

                            // Hide the IconMenuItem by updating the showIconMenuItem value
                            // notifcontroller.hideIconMenuItem();

                            Get.to(() => RejectedExitCommands());
                          }
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

                        itemId: 3, // Update this line
                        onTap: () {
                          if (!clickedStatusMap.containsKey(3)) {
                            clickedStatusMap[3] = true;
                            notifcontroller.notificationData.refresh();
                            notifcontroller.decreaseNotificationCount(
                                data.myRejectedCommandsNumber, 3);
                            notifcontroller.notificationData.refresh();

                            // Hide the IconMenuItem by updating the showIconMenuItem value
                            // notifcontroller.hideIconMenuItem();

                            Get.to(() => RejectedEntriesCommands());
                          }
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
