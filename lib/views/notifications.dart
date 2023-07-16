import 'package:flutter/material.dart';
import 'package:flutter_project/views/navigation_drawer.dart';
import '../widgets/icon_menu_item.dart';
import 'bottom_navigation_helper.dart';
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
            child: ListView(
              children: [
                IconMenuItem(
                  icon: Icons.workspaces_outlined,
                  title: 'Commands'.tr,
                  row1: 'You have x commands to treat'.tr,
                  onTap: () {
                    // Navigate to the Commands page

                    Get.to(() => Entries(
                          bottomNavigationBar: handleBottomNavigationBar(1),
                        ));
                  },
                ),
                IconMenuItem(
                  icon: Icons.receipt_outlined,
                  title: 'Invoices'.tr,
                  row1: 'You have x invoices to validate'.tr,
                  onTap: () {},
                ),
                IconMenuItem(
                  icon: Icons.shopping_cart_outlined,
                  title: 'Orders'.tr,
                  row1: 'You have x orders to treat'.tr,
                  onTap: () {},
                ),
                IconMenuItem(
                  icon: Icons.receipt_outlined,
                  title: 'Invoices'.tr,
                  row1: 'You have x invoices to pay'.tr,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: handleBottomNavigationBar(0),
    );
  }
}
