import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/views/navigation_drawer.dart';
import 'package:get/get.dart';
import '../../controllers/EntriesController.dart';
import '../../widgets/CommandsList.dart';
import '../../widgets/NewCommand.dart';
import '../navigation_drawer.dart';

class Entries extends GetView<EntriesController> {
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
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: const [
                  CommandCard(
                    commandReference: 'Command 1',
                    dateOfCreation: '2023-06-19',
                    articlesCount: 5,
                    userName: 'John Doe',
                  ),
                  SizedBox(height: 16.0),
                  CommandCard(
                    commandReference: 'Command 2',
                    dateOfCreation: '2023-06-18',
                    articlesCount: 3,
                    userName: 'Jane Smith',
                  ),
                  SizedBox(height: 16.0),
                  CommandCard(
                    commandReference: 'Command 3',
                    dateOfCreation: '2023-06-17',
                    articlesCount: 8,
                    userName: 'Mike Johnson',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Material(
                  color: Colors.transparent,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) => AddCommandModal(),
                      );
                    },
                    backgroundColor: Colors.blue,
                    icon: const Icon(Icons.add),
                    label: const Text('Create Command'),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
