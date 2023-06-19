import 'package:flutter/material.dart';
import 'package:flutter_project/navigation_drawer.dart';
import './navigation_drawer.dart';
import 'bottom_navigation_helper.dart';

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
      bottomNavigationBar: handleBottomNavigationBar(0, context),
    );
  }
}
