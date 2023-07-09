import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bottom_navigation_helper.dart';
import 'entries/entries.dart';
import 'notifications.dart';
import 'settings.dart';
import 'entries/entries.dart';
import 'exits/exits.dart';

import 'home.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: Container(
          color: Colors.grey[800], // Set the background color of the drawer
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 10, // vertical spacing
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined, color: Colors.white),
              title: const Text('Home',
                  style: TextStyle(color: Colors.white)), // Set the text color
              onTap: () {
                Get.offAll(() => const Home());
              },
            ),
            //const Divider(color: Colors.black54),
            ListTile(
              leading: const Icon(Icons.input, color: Colors.white),
              title: const Text('Entries',
                  style: TextStyle(color: Colors.white)), // Set the text color
              onTap: () {
                Get.to(() => Entries(
                      bottomNavigationBar: handleBottomNavigationBar(1),
                    ));
              },
            ),
            //const Divider(color: Colors.black54),
            ListTile(
              leading: const Icon(Icons.output, color: Colors.white),
              title: const Text('Exits',
                  style: TextStyle(color: Colors.white)), // Set the text color
              onTap: () {
                Get.to(() => Exits(
                      bottomNavigationBar: handleBottomNavigationBar(2),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text('Log out',
                  style: TextStyle(color: Colors.white)), // Set the text color
              onTap: () {},
            ),
          ],
        ),
      );
  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.person, color: Colors.white, size: 120),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.all(16),
        color: Colors.blue, // Set the background color to grey
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 12), // Add bottom padding
              child: _icon(),
            ),
            Text(
              'Maryam',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            Text(
              'maryam@example.com',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
}
