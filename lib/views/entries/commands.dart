import 'package:flutter/material.dart' hide NavigationDrawer;
import 'package:flutter_project/views/navigation_drawer.dart';
import 'package:get/get.dart';

import '../../controllers/EntriesController.dart';

// import '../../widgets/CommandsList.dart';
import '../bottom_navigation_helper.dart';

class Commands extends GetView<EntriesController> {
  Commands({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Commands'),
        backgroundColor: Colors.blue.shade700,
      ),
      bottomNavigationBar: handleBottomNavigationBar(0),
    );
  }
}
