import 'package:flutter/material.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 10, // vertical spacing

        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Home())),
          ),
          const Divider(color: Colors.black54),
          ListTile(
              leading: const Icon(Icons.workspaces_outlined),
              title: const Text('entries'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Entries(
                      bottomNavigationBar: handleBottomNavigationBar(1),
                    ),
                  ),
                );
              }),
          const Divider(color: Colors.black54),
          ListTile(
              leading: const Icon(Icons.workspaces_outlined),
              title: const Text('exits'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Exits(
                      bottomNavigationBar: handleBottomNavigationBar(2),
                    ),
                  ),
                );
              }),
        ],
      ));

  Widget buildHeader(BuildContext context) => Column(
        children: [
          CircleAvatar(
            radius: 52,
          ),
          SizedBox(height: 12),
          Text(
            'Maryam',
            style: TextStyle(fontSize: 28, color: Colors.black),
          ),
          Text(
            'maryam@example.com',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ],
      );
}
