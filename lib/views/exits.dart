import 'package:flutter/material.dart';
import 'package:flutter_project/views/navigation_drawer.dart';
import 'navigation_drawer.dart';

class Exits extends StatelessWidget {
  final BottomNavigationBar bottomNavigationBar;
  const Exits({Key? key, required this.bottomNavigationBar}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          title: const Text('Exits'),
          backgroundColor: Colors.blue.shade700,
        ),
        bottomNavigationBar: bottomNavigationBar,
      );
}
