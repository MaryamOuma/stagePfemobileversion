import 'package:flutter/material.dart';
import 'package:flutter_project/login/Profile.dart';
import 'package:flutter_project/settings.dart';

import 'commands.dart';
import 'home.dart';
import 'invoices.dart';
import 'notifications.dart';
import 'orders.dart';

BottomNavigationBar handleBottomNavigationBar(int index, BuildContext context) {
  switch (index) {
    case 0:
      return createHomeBottomNavigationBar(context);
      break;
    case 1:
      return createEntriesBottomNavigationBar(context);
      break;
    case 2:
      return createExitsBottomNavigationBar(context);
      break;

    default:
      return createDefaultBottomNavigationBar(context);
      break;
  }
}

BottomNavigationBar createDefaultBottomNavigationBar(BuildContext context) {
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

BottomNavigationBar createHomeBottomNavigationBar(BuildContext context) {
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
      handleHomeBottomNavigationBarTap(index, context);
    },
  );
}

void handleHomeBottomNavigationBarTap(int index, BuildContext context) {
  switch (index) {
    case 0:
      // Navigate to the Commands page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
      break;
    case 1:
      // Navigate to the Orders page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyNotifications()),
      );
      break;
    case 2:
      // Navigate to the Invoices page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Settings()),
      );
      break;
    case 3:
      // Navigate to the Invoices page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile()),
      );
      break;
    default:
      // Handle other cases or error
      break;
  }
}

BottomNavigationBar createEntriesBottomNavigationBar(BuildContext context) {
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
      handleEntriesBottomNavigationBarTap(index, context);
    },
  );
}

void handleEntriesBottomNavigationBarTap(int index, BuildContext context) {
  switch (index) {
    case 0:
      // Navigate to the Commands page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Commands()),
      );
      break;
    case 1:
      // Navigate to the Orders page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Orders()),
      );
      break;
    case 2:
      // Navigate to the Invoices page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Invoices()),
      );
      break;
    default:
      // Handle other cases or error
      break;
  }
}

BottomNavigationBar createExitsBottomNavigationBar(BuildContext context) {
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
      handleExitsBottomNavigationBarTap(index, context);
    },
  );
}

void handleExitsBottomNavigationBarTap(int index, BuildContext context) {
  switch (index) {
    case 0:
      // Navigate to the Commands page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Commands()),
      );
      break;
    case 1:
      // Navigate to the Orders page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Orders()),
      );
      break;
    case 2:
      // Navigate to the Invoices page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Invoices()),
      );
      break;
    default:
      // Handle other cases or error
      break;
  }
}
