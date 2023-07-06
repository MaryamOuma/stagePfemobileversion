import 'package:flutter/material.dart';
import 'package:flutter_project/views/settings.dart';
import 'package:flutter_project/views/login/Profile.dart';
import 'package:get/get.dart';
import 'entries/entries.dart';
import 'exits/exits.dart';
import 'home.dart';
import 'invoices.dart';
import 'notifications.dart';
import 'orders.dart';

BottomNavigationBar handleBottomNavigationBar(int index) {
  switch (index) {
    case 0:
      return createHomeBottomNavigationBar();
      break;
    case 1:
      return createEntriesBottomNavigationBar();
      break;
    case 2:
      return createExitsBottomNavigationBar();
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
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications),
        label: 'Notifications',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ],
    onTap: (index) {},
  );
}

BottomNavigationBar createHomeBottomNavigationBar() {
  // Create bottom navigation bar for Home page
  // Example:
  return BottomNavigationBar(
    currentIndex: 0,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications),
        label: 'Notifications',
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
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

BottomNavigationBar createEntriesBottomNavigationBar() {
  // Create bottom navigation bar for Entries page
  // Example:
  return BottomNavigationBar(
    currentIndex: 0,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.workspaces_outlined),
        label: 'Commands',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined),
        label: 'Orders',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.receipt_outlined),
        label: 'Invoices',
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
      Get.to(() {
        return Entries(
          bottomNavigationBar: handleBottomNavigationBar(1),
        );
      });

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

BottomNavigationBar createExitsBottomNavigationBar() {
  // Create bottom navigation bar for Exits page
  // Example:
  return BottomNavigationBar(
    currentIndex: 0,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.workspaces_outlined),
        label: 'Commands',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined),
        label: 'Orders',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.receipt_outlined),
        label: 'Invoices',
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
          bottomNavigationBar: handleBottomNavigationBar(2),
        );
      });
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
