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
        /*return Scaffold(
          drawer: const NavigationDrawer(),
          appBar: AppBar(
            title: const Text('Home view'),
            backgroundColor: Colors.blue.shade700,
          ),
          body: IndexedStack(
            index: controller.currentIndex,
            children: [
              // Existing pages from the controller
              ///controller.pages,
              // New ListView section
              ListView(
                children: [
                  Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/logo_dark.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning, Hizal',
                          style: bold.copyWith(
                            fontSize: 28,
                          ),
                        ),
                        Text(
                          'We wish you have a good day',
                          style:
                              regular.copyWith(fontSize: 20, color: darkGrey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Container(
                                height: 210,
                                width: 177,
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/basic_course.png'),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '3-10 MIN',
                                          style: medium.copyWith(
                                              fontSize: 11,
                                              color: Colors.white),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: grey,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Text(
                                            'START',
                                            style: medium.copyWith(
                                              fontSize: 12,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 210,
                              width: 177,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/relaxation_music.png'),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '3-10 MIN',
                                        style: medium.copyWith(
                                          fontSize: 11,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: black,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: Text(
                                          'START',
                                          style: medium.copyWith(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BannerPlayerWidgets(
                          background: 'assets/images/banner_daily_thought.png',
                          title: '',
                          subtitle: '',
                          buttonColor: 'light',
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Recommended for you',
                          style: medium.copyWith(fontSize: 24),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CardRecommendWisgets(
                                images: 'assets/images/focus_banner.png',
                                title: 'Focus',
                                subtitle: 'MEDITATION 3-10 MIN',
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              CardRecommendWisgets(
                                images: 'assets/images/happiness_banner.png',
                                title: 'Happiness',
                                subtitle: 'MEDITATION 3-10 MIN',
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              CardRecommendWisgets(
                                images: 'assets/images/focus_banner.png',
                                title: 'Focus',
                                subtitle: 'MEDITATION 3-10 MIN',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

class CardRecommendWisgets extends StatelessWidget {
  final String? images;
  final String? title;
  final String? subtitle;
  const CardRecommendWisgets({
    required this.images,
    required this.title,
    required this.subtitle,
  });
  @override
  Widget build(BuildContext context) {
    print('Images: $images');
    print('Title: $title');
    print('Subtitle: $subtitle');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 114,
          width: 162,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('$images'),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '${title}',
          style: bold.copyWith(
            fontSize: 18,
          ),
        ),
        Text(
          '${subtitle}',
          style: medium.copyWith(
            fontSize: 11,
            color: darkGrey,
          ),
        )
      ],*/
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
                      Expanded(
                          child: CardStaggerdWidgets(
                        label: 'You have 12 Entries Orders To Treat',
                        backgroundColor: Colors.red,
                        icon: Icons.shopping_cart,
                        onTap: () {
                          // Handle the onTap event for 'Reduce Stress'
                          Get.to(() => Orders());
                        },
                      )),
                      Expanded(
                          child: CardStaggerdWidgets(
                        label: 'You have 5 Exits Orders To Treat',
                        backgroundColor: Color.fromARGB(255, 89, 54, 244),
                        icon: Icons.shopping_cart,
                        onTap: () {
                          // Handle the onTap event for 'Reduce Stress'
                        },
                      )),
                      Expanded(
                          child: CardStaggerdWidgets(
                        label: 'You Have some expired articles',
                        backgroundColor: Colors.blue,
                        icon: Icons.article_outlined,
                        onTap: () {
                          // Handle the onTap event for 'Improve Performance'
                        },
                      )),
                      Expanded(
                          child: CardStaggerdWidgets(
                        label: 'You have 2 invoices To pay',
                        backgroundColor: Color.fromARGB(255, 54, 219, 244),
                        icon: Icons.receipt,
                        onTap: () {
                          // Handle the onTap event for 'Reduce Stress'
                        },
                      )),
                      Expanded(
                          child: CardStaggerdWidgets(
                        label: 'Invoices To validate',
                        backgroundColor: Colors.orange,
                        icon: Icons.receipt,
                        onTap: () {
                          // Handle the onTap event for 'Improve Performance'
                        },
                      )),
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
