import 'dart:math';

import 'package:flutter/material.dart' hide NavigationDrawer;
import 'package:flutter_project/views/navigation_drawer.dart';
import 'package:get/get.dart';
import '../../controllers/EntriesController.dart';
import '../../widgets/CommandsList.dart';
import '../../widgets/NewCommand.dart';
import '../navigation_drawer.dart';
import '../../controllers/AuthController.dart';


class Entries extends GetView<EntriesController> {
  final BottomNavigationBar bottomNavigationBar;
  const Entries({
    Key? key,
    required this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EntriesController controller = Get.put(EntriesController());
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Entries'),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: bottomNavigationBar,
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: controller.commands.length,
                  itemBuilder: (context, index) {
                    final command = controller.commands[index];
                    // print('Command at index $index: $command');
                    return CommandCard(
                      id: command.id,
                      commandReference: command.code,
                      dateOfCreation:
                      controller.formattedTimeDifference(command.createdAt),
                      articlesCount: command.articlesCount,
                      userName: command.userName,
                      price: command.price,
                      status: command.status,
                      department: command.department,
                    );
                  },
                );
              },
            ),
            ),
          /*
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
          */
        ],
      ),
    );
  }
}
