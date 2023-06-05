import 'package:flutter/material.dart';
import 'package:flutter_project/navigation_drawer.dart';
import './navigation_drawer.dart';

class MyNotifications extends StatelessWidget {
  const MyNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.blue.shade700,
      ));
}
