import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/ExitsController.dart';
import 'package:flutter_project/shared/theme.dart';
import 'package:flutter_project/views/navigation_drawer.dart';
import 'package:flutter_project/widgets/ExitsCommandList.dart';
import 'package:get/get.dart';
import '../navigation_drawer.dart';

class Exits extends GetView<ExitsController> {
  final BottomNavigationBar bottomNavigationBar;
  final TextEditingController searchController = TextEditingController();
  Exits({
    Key? key,
    required this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ExitsController controller = Get.put(ExitsController());
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
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              colors: [
                Color(0xffE99E22),
                blue,
                grey,
              ],
            ),
          ),
        ),
        title: SearchBar(
          searchController: searchController,
          onSearchChanged: controller.onSearchChanged,
        ),
        backgroundColor:
            Colors.transparent, // Set AppBar background color to transparent
        elevation: 0, // Remove the AppBar shadow
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
                    return ExitCommandCard(
                      id: command.id,
                      commandReference: command.code,
                      dateOfCreation:
                          controller.formattedTimeDifference(command.createdAt),
                      articlesCount: command.articlesCount,
                      userName: command.userName,
                      price: command.price,
                      status: command.status,
                      clientName: command.clientName,
                    );
                  },
                );
              },
            ),
          ),
          /*Padding(
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
          ),*/
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
          Text("exits_commands".tr,
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
                          hintText: 'search'.tr,
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
