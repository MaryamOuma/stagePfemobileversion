import 'package:flutter/material.dart';
import 'package:flutter_project/navigation_drawer.dart';
import './navigation_drawer.dart';
import 'bottom_navigation_helper.dart';

class Commands extends StatefulWidget {
  const Commands({Key? key}) : super(key: key);

  @override
  CommandsState createState() => CommandsState();
}

class CommandsState extends State<Commands> {
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          title: const Text('Commands'),
          backgroundColor: Colors.blue.shade700,
        ),
        bottomNavigationBar: handleBottomNavigationBar(3, context));
  }
}