import 'package:flutter/material.dart' hide NavigationDrawer;
import 'package:get/get.dart';

import '../../controllers/ProfileController.dart';
import '../../widgets/profile.dart';
import '../bottom_navigation_helper.dart';
import '../navigation_drawer.dart';

class Profile extends GetView<ProfileController> {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Body(),
      bottomNavigationBar: createHomeBottomNavigationBar(3),
    );
  }
}
