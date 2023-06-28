import 'package:flutter/material.dart';
import 'package:flutter_project/views/navigation_drawer.dart';
import 'bottom_navigation_helper.dart';
import 'navigation_drawer.dart';

class Invoices extends StatefulWidget {
  const Invoices({Key? key}) : super(key: key);

  @override
  InvoicesState createState() => InvoicesState();
}

class InvoicesState extends State<Invoices> {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Invoices'),
        backgroundColor: Colors.blue.shade700,
      ),
      bottomNavigationBar: handleBottomNavigationBar(0, context),
    );
  }
}
