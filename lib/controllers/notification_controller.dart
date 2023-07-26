// notification_controller.dart
import 'package:flutter_project/models/notification.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/product.dart';

class NotificationController extends GetxController {
  var notificationData = NotificationModel(
    notifications: 0,
    commandsNumber: 0,
    clientscommandsNumber: 0,
    myclientsRejectedCommandsNumber: 0,
    thresholdArticles: 0,
    expiringSoonArticles: 0,
    myRejectedCommandsNumber: 0,
    invoicesTopay: 0,
    invoicesToValidate: 0,
    exitinvoicesTopay: 0,
    exitInvoicesToValidate: 0,
    expirationArticles: 0,
  ).obs;
  // Use RxList instead of List for products
  RxList<Product> products = <Product>[].obs;
  final isLoading = true.obs;
// Add a map to store the clicked status for each IconMenuItem
  Map<int, bool> clickedStatusMap = {};
  // Add an RxInt variable to keep track of the viewed notifications count
  RxInt _viewedNotificationsCount = 0.obs;

  @override
  void onReady() {
    super.onReady();
    fetchAuthTokenAndNotifications();

    update();
  }

  Future<void> fetchAuthTokenAndNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authToken');
    //final email = prefs.getString('userEmail');
    if (token != null) {
      final notificationsFetched = await fetchNotifications(token);
      if (notificationsFetched) {
        print('Successfully fetched notifications');
      } else {
        print('Error fetching notifications');
      }
    } else {
      print('token is null');
    }
  }

  Future<bool> fetchNotifications(String token) async {
    final apiUrl = 'http://localhost:8000/api/user/notifications';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final originalData = data['notifications']['original'];
        notificationData.value = NotificationModel.fromJson(originalData);
        _viewedNotificationsCount.value =
            notificationData.value.notifications ?? 0;
        print(notificationData.value.notifications);
        // Trigger a rebuild of the widget tree
        // This will ensure the updated values are used in the products list
        // after the data is fetched.
        print(products);
        products.addAll([
          Product(
              'assets/icons/entries.png',
              'Entries commands to treat',
              'Entries commands to treat refer to requests initiated by staff members for specific articles required by various departments within an organization. These commands undergo a treatment process facilitated by the accountant, who assumes the responsibility of reviewing and assessing their viability. The accountant evaluates each command based on factors such as the availability of budgetary resources. Subsequently, the accountant can either approve the commands, ensuring the necessary articles are procured, or reject them if budget constraints or other considerations arise. This meticulous review process allows for effective allocation of resources, ensuring optimal financial management and alignment with organizational goals.',
              notificationData.value.commandsNumber ?? 0),
          Product(
              'assets/icons/exits.png',
              'Exits commands to treat',
              'Exits commands to treat pertain to orders placed by external clients for specific articles. These commands are processed and handled by the storekeeper, who assumes the responsibility of reviewing and managing them. The storekeeper meticulously evaluates each command, taking into account factors such as the availability of the requested articles and their remaining quantities in the inventory. Based on this assessment and other considerations, the storekeeper exercises discretion to either approve the command, ensuring the fulfillment of the client\'s order, or reject it for valid reasons. This diligent evaluation process guarantees efficient inventory management, facilitates seamless customer service, and maintains the integrity of the organization\'s supply chain operations.',
              notificationData.value.clientscommandsNumber ?? 0),
          Product(
              'assets/icons/payment.png',
              'Invoices to pay',
              'Invoices to pay refer to the financial documents generated for completed orders that require further processing for payment. These invoices signify the responsibility of the accounting department to initiate the payment process, ensuring that the outstanding amounts are settled in a timely manner.',
              notificationData.value.invoicesTopay ?? 0),
          Product(
              'assets/icons/validation.png',
              'Invoices to validate',
              'Invoices to validate represent the invoices that have been completely paid, either in a single payment or through installment payments. The validation process is undertaken by the accountant to ensure the accuracy and completeness of the payment records, confirming that the financial obligations associated with these invoices have been successfully fulfilled.',
              notificationData.value.invoicesToValidate ?? 0),
          Product(
              'assets/icons/expiration.png',
              'Expired articles',
              'Expired articles refer to the products or items that have reached their designated expiration date. These articles are no longer deemed usable or suitable for consumption due to potential quality degradation or safety concerns. Proper management of expired articles involves their removal or disposal from inventory to maintain compliance with regulations and ensure the delivery of fresh and safe products to customers',
              notificationData.value.expirationArticles ?? 0),
          Product(
              'assets/icons/threshold.png',
              'Articles close to threshold',
              'Articles close to the threshold are products or items whose remaining quantity is approaching a pre-defined threshold. This threshold indicates a minimum stock level that triggers the need for replenishment or reordering. Identifying articles close to the threshold allows proactive inventory management to avoid stockouts and ensure a smooth supply chain. By monitoring and taking timely action on these articles, businesses can maintain sufficient stock levels, prevent disruptions in production or sales, and meet customer demands effectively.',
              notificationData.value.thresholdArticles ?? 0),
        ]);

        print(products);

        return true; // Success
      } else {
        // Handle error if needed
        return false; // Error
      }
    } catch (e) {
      // Handle error if needed
      return false; // Error
    } finally {
      isLoading.value = false;
    }
  }

  void onSearchChanged(String query) {
    filterNotifications(query);
    //print(query);
  }

  void filterNotifications(String query) {
    /* if (query.isEmpty) {
      //print("query empty");
      // If the query is empty, show all commands
      commands.value = originalCommands;
    } else {
      //print("query : "+ query);
      // Filter the commands based on the query
      commands.value = originalCommands
          .where((command) =>
              command.code.toLowerCase().contains(query.toLowerCase()) ||
              command.articlesCount
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              command.userName.toLowerCase().contains(query.toLowerCase()) ||
              command.price.toLowerCase().contains(query.toLowerCase()) ||
              command.status.toLowerCase().contains(query.toLowerCase()) ||
              timeago
                  .format(command.createdAt)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              command.department.toLowerCase().contains(query.toLowerCase()))
          .toList();

      //print(commands.value);*/
  }

  // Method to decrement the viewedNotificationsCount if a condition is met
  Future<void> decreaseNotificationCount(
      int? countToDecrease, int itemId) async {
    if (countToDecrease! > 0) {
      _viewedNotificationsCount.value -= countToDecrease;
      if (_viewedNotificationsCount.value < 0) {
        _viewedNotificationsCount.value = 0;
      }
    }
  }

// Getter to get the value of the viewedNotificationsCount
  int get viewedNotificationsCount => _viewedNotificationsCount.value;
  RxBool showIconMenuItem = true.obs;

  void hideIconMenuItem() {
    showIconMenuItem.value = false;
  }

  void showIconMenuItemAgain() {
    showIconMenuItem.value = true;
  }

  String _userId = '';

  void setUserId(String userId) {
    _userId = userId;
  }

// Method to save user-specific data to SharedPreferences
  Future<void> saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('showIconMenuItem_$_userId', showIconMenuItem.value);
    prefs.setInt('notificationCount_$_userId', viewedNotificationsCount);
  }

  void printSharedPreferencesValues() async {
    // Get the SharedPreferences values for the first user
    final firstUserId = '67'; // Replace with the first user's ID
    final prefs1 = await SharedPreferences.getInstance();
    final showIconMenuItem1 = prefs1.getBool('showIconMenuItem_$firstUserId');
    final notificationCount1 = prefs1.getInt('notificationCount_$firstUserId');

    // Get the SharedPreferences values for the second user
    final secondUserId = _userId; // Replace with the second user's ID
    final prefs2 = await SharedPreferences.getInstance();
    final showIconMenuItem2 = prefs2.getBool('showIconMenuItem_$secondUserId');
    final notificationCount2 = prefs2.getInt('notificationCount_$secondUserId');

    // Print the values in the console
    print('User ID 1:');
    print('showIconMenuItem: $showIconMenuItem1');
    print('notificationCount: $notificationCount1');

    print('User ID 2:');
    print('showIconMenuItem: $showIconMenuItem2');
    print('notificationCount: $notificationCount2');
  }

  @override
  void onClose() {
    // Save user-specific data when the controller is disposed
    saveUserData();
    printSharedPreferencesValues();
    super.onClose();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    showIconMenuItem.value = prefs.getBool('showIconMenuItem_$_userId') ?? true;
    _viewedNotificationsCount.value =
        prefs.getInt('notificationCount_$_userId') ?? 0;
  }

  // ...

}
