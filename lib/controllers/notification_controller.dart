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
  List<Product> products = [];

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
        print(notificationData.value.notifications);
        // Trigger a rebuild of the widget tree
        // This will ensure the updated values are used in the products list
        // after the data is fetched.
        print(products);
        products = [
          /* Product(
              'assets/icons/entries.png',
              'Entries commands to treat',
              'Entries commands to treat refer to requests initiated by staff members for specific articles required by various departments within an organization. These commands undergo a treatment process facilitated by the accountant, who assumes the responsibility of reviewing and assessing their viability. The accountant evaluates each command based on factors such as the availability of budgetary resources. Subsequently, the accountant can either approve the commands, ensuring the necessary articles are procured, or reject them if budget constraints or other considerations arise. This meticulous review process allows for effective allocation of resources, ensuring optimal financial management and alignment with organizational goals.',
              notificationData.value.commandsNumber!),*/
          Product(
              'assets/icons/exits.png',
              'Exits commands to treat',
              'Exits commands to treat pertain to orders placed by external clients for specific articles. These commands are processed and handled by the storekeeper, who assumes the responsibility of reviewing and managing them. The storekeeper meticulously evaluates each command, taking into account factors such as the availability of the requested articles and their remaining quantities in the inventory. Based on this assessment and other considerations, the storekeeper exercises discretion to either approve the command, ensuring the fulfillment of the client\'s order, or reject it for valid reasons. This diligent evaluation process guarantees efficient inventory management, facilitates seamless customer service, and maintains the integrity of the organization\'s supply chain operations.',
              notificationData.value.clientscommandsNumber!),
          /* Product(
              'assets/icons/payment.png',
              'Invoices to pay',
              'Invoices to pay refer to the financial documents generated for completed orders that require further processing for payment. These invoices signify the responsibility of the accounting department to initiate the payment process, ensuring that the outstanding amounts are settled in a timely manner.',
              notificationData.value.clientscommandsNumber!),
          Product(
              'assets/icons/validation.png',
              'Invoices to validate',
              'Invoices to validate represent the invoices that have been completely paid, either in a single payment or through installment payments. The validation process is undertaken by the accountant to ensure the accuracy and completeness of the payment records, confirming that the financial obligations associated with these invoices have been successfully fulfilled.',
              notificationData.value.invoicesToValidate!),*/
          Product(
              'assets/icons/expiration.png',
              'Expired articles',
              'Expired articles refer to the products or items that have reached their designated expiration date. These articles are no longer deemed usable or suitable for consumption due to potential quality degradation or safety concerns. Proper management of expired articles involves their removal or disposal from inventory to maintain compliance with regulations and ensure the delivery of fresh and safe products to customers',
              notificationData.value.expirationArticles!),
          /*Product(
              'assets/icons/threshold.png',
              'Articles close to threshold',
              'Articles close to the threshold are products or items whose remaining quantity is approaching a pre-defined threshold. This threshold indicates a minimum stock level that triggers the need for replenishment or reordering. Identifying articles close to the threshold allows proactive inventory management to avoid stockouts and ensure a smooth supply chain. By monitoring and taking timely action on these articles, businesses can maintain sufficient stock levels, prevent disruptions in production or sales, and meet customer demands effectively.',
              notificationData.value.thresholdArticles!),*/
        ];

        print(products);

        return true; // Success
      } else {
        // Handle error if needed
        return false; // Error
      }
    } catch (e) {
      // Handle error if needed
      return false; // Error
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
}
