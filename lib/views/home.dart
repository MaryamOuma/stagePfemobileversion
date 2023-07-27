import 'package:flutter/material.dart';
import 'package:flutter_project/models/product.dart';
import 'package:flutter_project/views/bottom_navigation_helper.dart';
import 'package:flutter_project/views/navigation_drawer.dart';
import 'package:flutter_project/widgets/product_list.dart';
import 'package:get/get.dart';
import '../controllers/HomeController.dart';
import '../shared/theme.dart';

import 'package:flutter_project/widgets/tab_view.dart';

import 'package:flutter_project/controllers/notification_controller.dart';
import 'package:badges/badges.dart';

import 'custom_background.dart';

class Home extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

HomeController controller = Get.put(HomeController());
NotificationController notificationController =
    Get.put(NotificationController());
List<Product> products = notificationController.products;

List<String> timelines = ['dashboard'.tr];
String selectedTimeline = 'dashboard'.tr;

class _MainPageState extends State<Home> with TickerProviderStateMixin<Home> {
  late TabController tabController;
  late TabController bottomTabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    bottomTabController = TabController(length: 1, vsync: this);
  }

  // Declare a GlobalKey to access the ScaffoldState
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // Wrap NavigationDrawer with Theme to override icon color
    Widget drawer = NavigationDrawer();
    AppBar appBar = AppBar(
      title: Text(
        timelines[0],
        style: TextStyle(
          fontSize: timelines[0] == selectedTimeline ? 20 : 14,
          fontWeight: FontWeight.bold, // Make the text bold
          fontStyle: FontStyle.italic, // Add a styled font
          color: darkGrey,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: CustomDrawerButton(),
    );
    Widget topHeader = Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTimeline = timelines[0];

                    List<Product> products =
                        notificationController.products as List<Product>;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 8.0), // Add margin to the bottom
                  child: Text(''),
                ),
              ),
            ),
          ],
        ));

    /* Widget tabBar = TabBar(
      tabs: [
        Tab(text: 'articles'.tr),
        Tab(text: 'clients'.tr),
        Tab(text: 'suppliers'.tr),
        Tab(text: 'departments'.tr),
        Tab(text: 'stocks'.tr),
      ],
      labelStyle: TextStyle(fontSize: 16.0),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.0,
      ),
      labelColor: darkGrey,
      unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.5),
      isScrollable: true,
      controller: tabController,
    );*/

    return Scaffold(
      drawer: drawer,
      bottomNavigationBar: createHomeBottomNavigationBar(0),
      body: CustomPaint(
        painter: MainBackground(),
        child: TabBarView(
          controller: bottomTabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            SafeArea(
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  // These are the slivers that show up in the "outer" scroll view.
                  return <Widget>[
                    SliverToBoxAdapter(
                      child: appBar,
                    ),
                    SliverToBoxAdapter(
                      child: topHeader,
                    ),
                    SliverToBoxAdapter(
                      child: Obx(() => ProductList(
                          products: notificationController.products.toList())),
                    ),
                    /* SliverToBoxAdapter(
                      child: tabBar,
                    )*/
                  ];
                },
                body: TabView(
                  tabController: tabController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDrawerButton extends StatefulWidget {
  const CustomDrawerButton({Key? key}) : super(key: key);

  @override
  _CustomDrawerButtonState createState() => _CustomDrawerButtonState();
}

class _CustomDrawerButtonState extends State<CustomDrawerButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Open the drawer when the button is tapped
        Scaffold.of(context).openDrawer();
      },
      child: Container(
        color: isHovered ? Colors.grey[300] : Colors.transparent,
        child: Icon(Icons.menu, color: darkGrey),
      ),
    );
  }
}
