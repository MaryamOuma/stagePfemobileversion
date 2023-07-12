import 'package:flutter/material.dart' hide NavigationDrawer;
import 'package:get/get.dart';
import '../controllers/SettingsController.dart';
import '../widgets/settings.dart';
import 'bottom_navigation_helper.dart';
import 'navigation_drawer.dart';

class Settings extends GetView<SettingsController> {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Body(),
      bottomNavigationBar: handleBottomNavigationBar(0),
    );
  }
}
