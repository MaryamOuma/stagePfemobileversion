import 'package:flutter/material.dart';
import 'package:flutter_project/views/navigation_drawer.dart';

import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../controllers/HomeController.dart';
import '../shared/theme.dart';
import '../widgets/CardStaggerdWidgets.dart';
import 'orders.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        print('Building HomeView');
        return Scaffold(
          drawer: const NavigationDrawer(),
          appBar: AppBar(
            title: const Text('Home'),
            backgroundColor: Colors.blue.shade700,
          ),
          body: IndexedStack(
            index: controller.currentIndex,
            children: [
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    'YOUR',
                    style: bold.copyWith(
                      fontSize: 28,
                    ),
                  ),
                  Text(
                    'DASHBOARD',
                    style: regular.copyWith(
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'choose a topic to focuse on:',
                    style: regular.copyWith(
                      fontSize: 20,
                      color: darkGrey,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24,
                    children: [
                      CardStaggerdWidgets(
                        label: 'You have 12 Entries Orders To Treat',
                        backgroundColor: Colors.red,
                        icon: Icons.shopping_cart,
                        onTap: () {
                          // Handle the onTap event for 'Reduce Stress'
                          Get.to(() => Orders());
                        },
                      ),

                      CardStaggerdWidgets(
                        label: 'You have 5 Exits Orders To Treat',
                        backgroundColor: Color.fromARGB(255, 89, 54, 244),
                        icon: Icons.shopping_cart,
                        onTap: () {
                          // Handle the onTap event for 'Reduce Stress'
                        },
                      ),

                      CardStaggerdWidgets(
                        label: 'You Have some expired articles',
                        backgroundColor: Colors.blue,
                        icon: Icons.article_outlined,
                        onTap: () {
                          // Handle the onTap event for 'Improve Performance'
                        },
                      ),

                      CardStaggerdWidgets(
                        label: 'You have 2 invoices To pay',
                        backgroundColor: Color.fromARGB(255, 54, 219, 244),
                        icon: Icons.receipt,
                        onTap: () {
                          // Handle the onTap event for 'Reduce Stress'
                        },
                      ),
                      CardStaggerdWidgets(
                        label: 'Invoices To validate',
                        backgroundColor: Colors.orange,
                        icon: Icons.receipt,
                        onTap: () {
                          // Handle the onTap event for 'Improve Performance'
                        },
                      ),
// Add more CardStaggerdWidgets with different colors and icons
                    ],
                  ),
                ],
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifications',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                backgroundColor: Colors.blue,
              ),
            ],
            onTap: (index) => controller.navigateToPage(index),
          ),
        );
      },
    );
  }
}
