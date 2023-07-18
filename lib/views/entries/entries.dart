import 'dart:math';

import 'package:flutter/material.dart' hide NavigationDrawer;
import 'package:flutter_project/views/navigation_drawer.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

import '../../controllers/EntriesController.dart';
import '../../widgets/CommandsList.dart';
import '../navigation_drawer.dart';
import '../search_page.dart';

class Entries extends GetView<EntriesController> {
  final BottomNavigationBar bottomNavigationBar;
  final TextEditingController searchController = TextEditingController();

  Entries({
    Key? key,
    required this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EntriesController controller = Get.put(EntriesController());

    void onSearchChanged() {
      // Perform search based on the entered query
      String query = searchController.text;
      controller.filterCommands(query);
      print("on changed");
      // Implement search logic here
    }

    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: SearchBar(
          searchController: searchController,
          onSearchChanged: controller.onSearchChanged,
        ),
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
        ],
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  final TextEditingController searchController;
  final Function(String) onSearchChanged;

  const SearchBar({
    Key? key,
    required this.searchController,
    required this.onSearchChanged,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>
    with SingleTickerProviderStateMixin {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!_isActive)
          Text("Entries Commands",
              style: Theme.of(context).appBarTheme.titleTextStyle),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: AnimatedSize(
              duration: const Duration(milliseconds: 250),
              child: _isActive
                  ? Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0)),
                      child: TextField(
                        controller: widget.searchController,
                        onChanged: widget.onSearchChanged,
                        decoration: InputDecoration(
                          hintText: 'Search for something',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isActive = false;
                                widget.searchController.clear();
                                widget.onSearchChanged('');
                              });
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ),
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          _isActive = true;
                        });
                      },
                      icon: const Icon(Icons.search)),
            ),
          ),
        ),
      ],
    );
  }
}
