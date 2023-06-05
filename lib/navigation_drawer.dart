import 'package:flutter/material.dart';
import 'package:flutter_project/main.dart';
import './notifications.dart';
import './settings.dart';
import './entries.dart';
import './exits.dart';

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
                MaterialPageRoute(builder: (context) => const MyApp())),
          ),
          const Divider(color: Colors.black54),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('settings'),
            onTap: () {
              //close navigation drawer once i return to the previous page until i click on it to appear
              Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Settings()));
            },
          ),
          const Divider(color: Colors.black54),
          ListTile(
              leading: const Icon(Icons.workspaces_outlined),
              title: const Text('entries'),
              onTap: () {
                //close navigation drawer once i return to the previous page until i click on it to appear
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Entries()));
              }),
          const Divider(color: Colors.black54),
          ListTile(
              leading: const Icon(Icons.workspaces_outlined),
              title: const Text('exits'),
              onTap: () {
                //close navigation drawer once i return to the previous page until i click on it to appear
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Exits()));
              }),
          const Divider(color: Colors.black54),
          ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('notifications'),
              onTap: () {
                //close navigation drawer once i return to the previous page until i click on it to appear
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyNotifications()));
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
