import 'package:flutter/material.dart'hide NavigationDrawer;
import 'package:flutter_project/navigation_drawer.dart';
import './navigation_drawer.dart';

class Entries extends StatelessWidget {
  final BottomNavigationBar bottomNavigationBar;

  const Entries({Key? key, required this.bottomNavigationBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          title: const Text('Entries'),
          backgroundColor: Colors.blue.shade700,
        ),
        bottomNavigationBar: bottomNavigationBar,
        body: Column(
          children: [
            Expanded(
              child: Container(
                  // Your existing body content goes here
                  ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Align(
                    alignment: Alignment.topRight,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        // Button action
                      },
                      backgroundColor: Colors.blue,
                      icon: const Icon(Icons.add),
                      label: const Text('Create Command'),
                    )),
              ),
            ),
          ],
        ),
      );
}
