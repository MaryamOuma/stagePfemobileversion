import 'package:flutter/material.dart' hide NavigationDrawer;
import 'package:flutter_project/views/navigation_drawer.dart';
import 'bottom_navigation_helper.dart';
import 'navigation_drawer.dart';

class MyNotifications extends StatefulWidget {
  const MyNotifications({Key? key}) : super(key: key);

  @override
  MyNotificationsState createState() => MyNotificationsState();
}

class MyNotificationsState extends State<MyNotifications> {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.blue.shade700,
      ),
      bottomNavigationBar: handleBottomNavigationBar(0),
    );
  }
}