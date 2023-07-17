import 'package:flutter/material.dart' hide NavigationDrawer;
import 'package:flutter_project/views/navigation_drawer.dart';
import 'package:get/get.dart';
import '../controllers/HomeController.dart';
import '../shared/theme.dart';
import '../models/product.dart';
import 'package:flutter_project/widgets/product_list.dart';
import 'package:flutter_project/widgets/tab_view.dart';

import 'custom_background.dart';

class Home extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

HomeController controller = Get.put(HomeController());

List<String> timelines = ['Dashboard'];
String selectedTimeline = 'Dashboard';

List<Product> products = [
  Product(
      'assets/icons/entries.png',
      'Entries commands to treat',
      'Entries commands to treat refer to requests initiated by staff members for specific articles required by various departments within an organization. These commands undergo a treatment process facilitated by the accountant, who assumes the responsibility of reviewing and assessing their viability. The accountant evaluates each command based on factors such as the availability of budgetary resources. Subsequently, the accountant can either approve the commands, ensuring the necessary articles are procured, or reject them if budget constraints or other considerations arise. This meticulous review process allows for effective allocation of resources, ensuring optimal financial management and alignment with organizational goals.',
      12),
  Product(
      'assets/icons/exits.png',
      'Exits commands to treat',
      'Exits commands to treat pertain to orders placed by external clients for specific articles. These commands are processed and handled by the storekeeper, who assumes the responsibility of reviewing and managing them. The storekeeper meticulously evaluates each command, taking into account factors such as the availability of the requested articles and their remaining quantities in the inventory. Based on this assessment and other considerations, the storekeeper exercises discretion to either approve the command, ensuring the fulfillment of the client\'s order, or reject it for valid reasons. This diligent evaluation process guarantees efficient inventory management, facilitates seamless customer service, and maintains the integrity of the organization\'s supply chain operations.',
      15),
  Product(
      'assets/icons/payment.png',
      'Invoices to pay',
      'Invoices to pay refer to the financial documents generated for completed orders that require further processing for payment. These invoices signify the responsibility of the accounting department to initiate the payment process, ensuring that the outstanding amounts are settled in a timely manner.',
      6),
  Product(
      'assets/icons/validation.png',
      'Invoices to validate',
      'Invoices to validate represent the invoices that have been completely paid, either in a single payment or through installment payments. The validation process is undertaken by the accountant to ensure the accuracy and completeness of the payment records, confirming that the financial obligations associated with these invoices have been successfully fulfilled.',
      4),
  Product(
      'assets/icons/expiration.png',
      'Expired articles',
      'Expired articles refer to the products or items that have reached their designated expiration date. These articles are no longer deemed usable or suitable for consumption due to potential quality degradation or safety concerns. Proper management of expired articles involves their removal or disposal from inventory to maintain compliance with regulations and ensure the delivery of fresh and safe products to customers',
      33),
  Product(
      'assets/icons/threshold.png',
      'Articles close to threshold',
      'Articles close to the threshold are products or items whose remaining quantity is approaching a pre-defined threshold. This threshold indicates a minimum stock level that triggers the need for replenishment or reordering. Identifying articles close to the threshold allows proactive inventory management to avoid stockouts and ensure a smooth supply chain. By monitoring and taking timely action on these articles, businesses can maintain sufficient stock levels, prevent disruptions in production or sales, and meet customer demands effectively.',
      0),
];

class _MainPageState extends State<Home> with TickerProviderStateMixin<Home> {
  late TabController tabController;
  late TabController bottomTabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    bottomTabController = TabController(length: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
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
                    products = [
                      Product(
                          'assets/icons/entries.png',
                          'Entries commands to treat',
                          'Entries commands to treat refer to requests initiated by staff members for specific articles required by various departments within an organization. These commands undergo a treatment process facilitated by the accountant, who assumes the responsibility of reviewing and assessing their viability. The accountant evaluates each command based on factors such as the availability of budgetary resources. Subsequently, the accountant can either approve the commands, ensuring the necessary articles are procured, or reject them if budget constraints or other considerations arise. This meticulous review process allows for effective allocation of resources, ensuring optimal financial management and alignment with organizational goals.',
                          12),
                      Product(
                          'assets/icons/exits.png',
                          'Exits commands to treat',
                          'Exits commands to treat pertain to orders placed by external clients for specific articles. These commands are processed and handled by the storekeeper, who assumes the responsibility of reviewing and managing them. The storekeeper meticulously evaluates each command, taking into account factors such as the availability of the requested articles and their remaining quantities in the inventory. Based on this assessment and other considerations, the storekeeper exercises discretion to either approve the command, ensuring the fulfillment of the client\'s order, or reject it for valid reasons. This diligent evaluation process guarantees efficient inventory management, facilitates seamless customer service, and maintains the integrity of the organization\'s supply chain operations.',
                          15),
                      Product(
                          'assets/icons/payment.png',
                          'Invoices to pay',
                          'Invoices to pay refer to the financial documents generated for completed orders that require further processing for payment. These invoices signify the responsibility of the accounting department to initiate the payment process, ensuring that the outstanding amounts are settled in a timely manner.',
                          6),
                      Product(
                          'assets/icons/validation.png',
                          'Invoices to validate',
                          'Invoices to validate represent the invoices that have been completely paid, either in a single payment or through installment payments. The validation process is undertaken by the accountant to ensure the accuracy and completeness of the payment records, confirming that the financial obligations associated with these invoices have been successfully fulfilled.',
                          4),
                      Product(
                          'assets/icons/expiration.png',
                          'Expired articles',
                          'Expired articles refer to the products or items that have reached their designated expiration date. These articles are no longer deemed usable or suitable for consumption due to potential quality degradation or safety concerns. Proper management of expired articles involves their removal or disposal from inventory to maintain compliance with regulations and ensure the delivery of fresh and safe products to customers',
                          33),
                      Product(
                          'assets/icons/threshold.png',
                          'Articles close to threshold',
                          'Articles close to the threshold are products or items whose remaining quantity is approaching a pre-defined threshold. This threshold indicates a minimum stock level that triggers the need for replenishment or reordering. Identifying articles close to the threshold allows proactive inventory management to avoid stockouts and ensure a smooth supply chain. By monitoring and taking timely action on these articles, businesses can maintain sufficient stock levels, prevent disruptions in production or sales, and meet customer demands effectively.',
                          0),
                    ];
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
        Tab(text: 'Articles'),
        Tab(text: 'Clients'),
        Tab(text: 'Suppliers'),
        Tab(text: 'Departments'),
        Tab(text: 'Stocks'),

        /* Tab(text: 'Companies'),
        Tab(text: 'Sites'),
        Tab(text: 'Banks'),
        Tab(text: 'Families'),
        Tab(text: 'Currencies'),
        Tab(text: 'Services'),*/
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
