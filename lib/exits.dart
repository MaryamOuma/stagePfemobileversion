import 'package:flutter/material.dart';
import 'package:flutter_project/navigation_drawer.dart';
import './navigation_drawer.dart';

class Exits extends StatelessWidget {
  const Exits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Exits'),
        backgroundColor: Colors.blue.shade700,
      ));
}
