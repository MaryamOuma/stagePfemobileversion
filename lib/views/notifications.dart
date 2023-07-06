import 'package:flutter/material.dart';
import 'package:flutter_project/views/entries/commands.dart';
import 'package:flutter_project/views/navigation_drawer.dart';
import '../widgets/icon_menu_item.dart';
import 'bottom_navigation_helper.dart';
import 'entries/commands.dart';
import 'entries/entries.dart';
import 'navigation_drawer.dart';
import 'package:get/get.dart';
import '../controllers/NotificationsController.dart';

class MyNotifications extends GetView<NotificationsController> {
  MyNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        IconMenuItem(
            icon: (Icons.workspaces_outlined),
            title: 'Commands'.tr,
            row1: 'You have x commands to treat'.tr,
            onTap: () {
              // Navigate to the Commands page
              Get.to(() {
                return Entries(
                  bottomNavigationBar: handleBottomNavigationBar(1),
                );
              });
            }),
        IconMenuItem(
            icon: (Icons.receipt_outlined),
            title: 'Invoices'.tr,
            row1: 'You have x invoices to validate'.tr,
            onTap: () {}),
        IconMenuItem(
            icon: (Icons.shopping_cart_outlined),
            title: 'Orders'.tr,
            row1: 'You have x orders to treat'.tr,
            onTap: () {}),
        IconMenuItem(
            icon: (Icons.receipt_outlined),
            title: 'Invoices'.tr,
            row1: 'You have x invoices to pay'.tr,
            onTap: () {}),
      ]),
      bottomNavigationBar: handleBottomNavigationBar(0),
    );
  }
}
