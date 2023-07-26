import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/notification_controller.dart';
import 'package:flutter_project/views/exits/orders.dart';
import 'package:flutter_project/views/exits/invoices.dart';
import 'package:flutter_project/views/settings/settings.dart';
import 'package:flutter_project/views/login/Profile.dart';
import 'package:get/get.dart';
import 'entries/entries.dart';
import 'exits/exits.dart';
import 'home.dart';
import 'entries/invoices.dart';
import 'notifications.dart';
import 'entries/orders.dart';

BottomNavigationBar handleBottomNavigationBar(int index) {
  switch (index) {
    case 0:
      return createHomeBottomNavigationBar(0);
      break;
    case 1:
      return createEntriesBottomNavigationBar(0);
      break;
    case 2:
      return createExitsBottomNavigationBar(0);
      break;

    default:
      return createDefaultBottomNavigationBar();
      break;
  }
}

BottomNavigationBar createDefaultBottomNavigationBar() {
  // Create bottom navigation bar for Home page
  // Example:
  return BottomNavigationBar(
    currentIndex: 0,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'home'.tr,
      ),
      BottomNavigationBarItem(
        icon: Badge(
          // Wrap the Icon with Badge widget
          badgeContent: Obx(() {
            final data = notificationController.notificationData.value;
            return Text(
              data.notifications?.toString() ??
                  '0', // Display the notification count
              style: TextStyle(color: Colors.white),
            );
          }),
          badgeColor: Color(0xffE99E22), // Customize the badge background color
          position: BadgePosition.topEnd(
              top: -12, end: -12), // Position the badge on top of the icon
          child: Icon(Icons.notifications),
        ),
        label: 'notifications'.tr,
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'settings'.tr,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profil'.tr,
      ),
    ],
    onTap: (index) {},
  );
}

BottomNavigationBar createHomeBottomNavigationBar(int selectedIndex) {
  // Create bottom navigation bar for Home page
  // Example:
  return BottomNavigationBar(
    currentIndex: selectedIndex,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'home'.tr,
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: Badge(
          // Wrap the Icon with Badge widget
          badgeContent: Obx(() {
            NotificationController notificationController = Get.find();
            //final data = notificationController.notificationData.value;

            return Text(
              notificationController.viewedNotificationsCount
                  .toString(), // Display the notification count
              style: TextStyle(color: Colors.white),
            );
          }),
          badgeColor: Color(0xffE99E22), // Customize the badge background color
          position: BadgePosition.topEnd(
              top: -12, end: -12), // Position the badge on top of the icon
          child: Icon(Icons.notifications),
        ),
        label: 'notifications'.tr,
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'settings'.tr,
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'profil'.tr,
        backgroundColor: Colors.blue,
      ),
    ],
    onTap: (index) {
      handleHomeBottomNavigationBarTap(index);
    },
  );
}

void handleHomeBottomNavigationBarTap(int index) {
  switch (index) {
    case 0:
      // Navigate to the Home page
      Get.to(() => Home());
      break;
    case 1:
      // Navigate to the Notifications page
      Get.to(() => MyNotifications());
      break;
    case 2:
      // Navigate to the Settings page
      Get.to(() => Settings());
      break;
    case 3:
      // Navigate to the Profile page
      Get.to(() => Profile());
      break;
    default:
      // Handle other cases or error
      break;
  }
}

BottomNavigationBar createEntriesBottomNavigationBar(int selectedIndex) {
  // Create bottom navigation bar for Entries page
  // Example:
  return BottomNavigationBar(
    currentIndex: selectedIndex,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.workspaces_outlined),
        label: 'commands'.tr,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined),
        label: 'orders'.tr,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.receipt_outlined),
        label: 'invoices'.tr,
      ),
    ],
    onTap: (index) {
      handleEntriesBottomNavigationBarTap(index);
    },
  );
}

void handleEntriesBottomNavigationBarTap(int index) {
  switch (index) {
    case 0:
      // Navigate to the Commands page

      Get.to(() => Entries(
            bottomNavigationBar: createEntriesBottomNavigationBar(0),
          ));

      break;
    case 1:
      // Navigate to the Orders page
      Get.to(() => Orders());
      break;
    case 2:
      // Navigate to the Invoices page
      Get.to(() => Invoices());
      break;
    default:
      // Handle other cases or error
      break;
  }
}

BottomNavigationBar createExitsBottomNavigationBar(int selectedIndex) {
  // Create bottom navigation bar for Exits page
  // Example:
  return BottomNavigationBar(
    currentIndex: selectedIndex,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.workspaces_outlined),
        label: 'commands'.tr,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined),
        label: 'orders'.tr,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.receipt_outlined),
        label: 'invoices'.tr,
      ),
    ],
    onTap: (index) {
      handleExitsBottomNavigationBarTap(index);
    },
  );
}

void handleExitsBottomNavigationBarTap(int index) {
  switch (index) {
    case 0:
      Get.to(() {
        return Exits(
          bottomNavigationBar: handleBottomNavigationBar(0),
        );
      });
      break;
    case 1:
      // Navigate to the Orders page
      Get.to(() => ExitOrders());
      break;
    case 2:
      // Navigate to the Invoices page
      Get.to(() => ExitInvoices());
      break;
    default:
      // Handle other cases or error
      break;
  }
}
