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
// Access the products list from the controller
//List<Product> products = notificationController.products;
List<Product> products = [
  Product(
      'assets/icons/entries.png',
      'entries_commands_to_treat'.tr,
      'Entries commands to treat refer to requests initiated by staff members for specific articles required by various departments within an organization. These commands undergo a treatment process facilitated by the accountant, who assumes the responsibility of reviewing and assessing their viability. The accountant evaluates each command based on factors such as the availability of budgetary resources. Subsequently, the accountant can either approve the commands, ensuring the necessary articles are procured, or reject them if budget constraints or other considerations arise. This meticulous review process allows for effective allocation of resources, ensuring optimal financial management and alignment with organizational goals.',
      7),
  Product(
      'assets/icons/exits.png',
      'exits_commands_to_treat'.tr,
      'Exits commands to treat pertain to orders placed by external clients for specific articles. These commands are processed and handled by the storekeeper, who assumes the responsibility of reviewing and managing them. The storekeeper meticulously evaluates each command, taking into account factors such as the availability of the requested articles and their remaining quantities in the inventory. Based on this assessment and other considerations, the storekeeper exercises discretion to either approve the command, ensuring the fulfillment of the client\'s order, or reject it for valid reasons. This diligent evaluation process guarantees efficient inventory management, facilitates seamless customer service, and maintains the integrity of the organization\'s supply chain operations.',
      33),
  Product(
      'assets/icons/payment.png',
      'invoices_to_pay'.tr,
      'Invoices to pay refer to the financial documents generated for completed orders that require further processing for payment. These invoices signify the responsibility of the accounting department to initiate the payment process, ensuring that the outstanding amounts are settled in a timely manner.',
      14),
  Product(
      'assets/icons/validation.png',
      'invoices_to_validate'.tr,
      'Invoices to validate represent the invoices that have been completely paid, either in a single payment or through installment payments. The validation process is undertaken by the accountant to ensure the accuracy and completeness of the payment records, confirming that the financial obligations associated with these invoices have been successfully fulfilled.',
      12),
  Product(
      'assets/icons/expiration.png',
      'expired_articles'.tr,
      'Expired articles refer to the products or items that have reached their designated expiration date. These articles are no longer deemed usable or suitable for consumption due to potential quality degradation or safety concerns. Proper management of expired articles involves their removal or disposal from inventory to maintain compliance with regulations and ensure the delivery of fresh and safe products to customers',
      55),
  Product(
      'assets/icons/threshold.png',
      'articles_close_to_threshold'.tr,
      'Articles close to the threshold are products or items whose remaining quantity is approaching a pre-defined threshold. This threshold indicates a minimum stock level that triggers the need for replenishment or reordering. Identifying articles close to the threshold allows proactive inventory management to avoid stockouts and ensure a smooth supply chain. By monitoring and taking timely action on these articles, businesses can maintain sufficient stock levels, prevent disruptions in production or sales, and meet customer demands effectively.',
      5),
];

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
                    products = products;
                    /* products = [
                      Product(
                          'assets/icons/entries.png',
                          'Entries commands to treat',
                          'Entries commands to treat refer to requests initiated by staff members for specific articles required by various departments within an organization. These commands undergo a treatment process facilitated by the accountant, who assumes the responsibility of reviewing and assessing their viability. The accountant evaluates each command based on factors such as the availability of budgetary resources. Subsequently, the accountant can either approve the commands, ensuring the necessary articles are procured, or reject them if budget constraints or other considerations arise. This meticulous review process allows for effective allocation of resources, ensuring optimal financial management and alignment with organizational goals.',
                          7),
                      Product(
                          'assets/icons/exits.png',
                          'Exits commands to treat',
                          'Exits commands to treat pertain to orders placed by external clients for specific articles. These commands are processed and handled by the storekeeper, who assumes the responsibility of reviewing and managing them. The storekeeper meticulously evaluates each command, taking into account factors such as the availability of the requested articles and their remaining quantities in the inventory. Based on this assessment and other considerations, the storekeeper exercises discretion to either approve the command, ensuring the fulfillment of the client\'s order, or reject it for valid reasons. This diligent evaluation process guarantees efficient inventory management, facilitates seamless customer service, and maintains the integrity of the organization\'s supply chain operations.',
                          33),
                      Product(
                          'assets/icons/payment.png',
                          'Invoices to pay',
                          'Invoices to pay refer to the financial documents generated for completed orders that require further processing for payment. These invoices signify the responsibility of the accounting department to initiate the payment process, ensuring that the outstanding amounts are settled in a timely manner.',
                          14),
                      Product(
                          'assets/icons/validation.png',
                          'Invoices to validate',
                          'Invoices to validate represent the invoices that have been completely paid, either in a single payment or through installment payments. The validation process is undertaken by the accountant to ensure the accuracy and completeness of the payment records, confirming that the financial obligations associated with these invoices have been successfully fulfilled.',
                          12),
                      Product(
                          'assets/icons/expiration.png',
                          'Expired articles',
                          'Expired articles refer to the products or items that have reached their designated expiration date. These articles are no longer deemed usable or suitable for consumption due to potential quality degradation or safety concerns. Proper management of expired articles involves their removal or disposal from inventory to maintain compliance with regulations and ensure the delivery of fresh and safe products to customers',
                          55),
                      Product(
                          'assets/icons/threshold.png',
                          'Articles close to threshold',
                          'Articles close to the threshold are products or items whose remaining quantity is approaching a pre-defined threshold. This threshold indicates a minimum stock level that triggers the need for replenishment or reordering. Identifying articles close to the threshold allows proactive inventory management to avoid stockouts and ensure a smooth supply chain. By monitoring and taking timely action on these articles, businesses can maintain sufficient stock levels, prevent disruptions in production or sales, and meet customer demands effectively.',
                          5),
                    ];*/
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

    Widget tabBar = TabBar(
      tabs: [
        Tab(text: 'articles'.tr),
        Tab(text: 'clients'.tr),
        Tab(text: 'suppliers'.tr),
        Tab(text: 'departments'.tr),
        Tab(text: 'stocks'.tr),

        /* Tab(text: 'companies'.tr),
        Tab(text: 'sites'.tr),
        Tab(text: 'banks'.tr),
        Tab(text: 'families'.tr),
        Tab(text: 'currencies'.tr),
        Tab(text: 'services'.tr),*/
      ],
      labelStyle: TextStyle(fontSize: 16.0),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.0,
      ),
      labelColor: darkGrey,
      unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.5),
      isScrollable: true,
      controller: tabController,
    );

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
                      child: ProductList(
                        products: products,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: tabBar,
                    )
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
