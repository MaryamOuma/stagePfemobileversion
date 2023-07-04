import 'package:flutter/material.dart' hide NavigationDrawer;
import 'package:flutter_project/views/navigation_drawer.dart';
import 'bottom_navigation_helper.dart';
import 'navigation_drawer.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  OrdersState createState() => OrdersState();
}

class OrdersState extends State<Orders> {
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          title: const Text('Orders'),
          backgroundColor: Colors.blue.shade700,
        ),
        bottomNavigationBar: handleBottomNavigationBar(3, context));
  }
}
