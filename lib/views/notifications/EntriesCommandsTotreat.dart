import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/notification_controller.dart';
import 'package:flutter_project/shared/theme.dart';
import 'package:flutter_project/views/navigation_drawer.dart';
import 'package:flutter_project/widgets/CommandsList.dart';
import 'package:get/get.dart';
import '../navigation_drawer.dart';

class EntriesCommandsTotreat extends GetView<NotificationController> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final NotificationController controller = Get.put(NotificationController());
    /* void onSearchChanged() {
      // Perform search based on the entered query
      String query = searchController.text;
      controller.filterCommands(query);
      print("on changed");
      // Implement search logic here
    }*/

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
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                final data = controller.notificationData.value;
                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: data.commands?.length ?? 0,
                  itemBuilder: (context, index) {
                    final command = data.commands![index];

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
          Text("entries_commands".tr,
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
