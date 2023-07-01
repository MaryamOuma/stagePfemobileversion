import 'package:flutter/material.dart';
import 'package:flutter_project/views/navigation_drawer.dart';

import '../bottom_navigation_helper.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blue.shade700,
      ),
      bottomNavigationBar: handleBottomNavigationBar(0),
    );
  }
}
