import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import '../models/purchaseOrder.dart';

class PurchaseOrderController extends GetxController {
  final purchaseOrders = <PurchaseOrder>[].obs;
  final RxString authToken = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAuthToken();
  }

  Future<void> fetchAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authToken');
    if (token != null) {
      authToken.value = token;
      fetchPurchaseOrders(token);
    }
  }

  Future<void> fetchPurchaseOrders(String token) async {
    if (token != null && token.isNotEmpty) {
      try {
        print('im trying');
        final response = await http.get(
          Uri.parse('http://localhost:8000/api/index/orders'),
          headers: {'Authorization': 'Bearer $token'},
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          //print('API response: $data');

          final purchaseOrdersData = data['purchase_info'] as List<dynamic>;

          final List<PurchaseOrder> fetchedPurchaseOrders = purchaseOrdersData
              .map((items) => PurchaseOrder.fromJson(items))
              .toList();
          //print('your purchase order : $fetchedPurchaseOrders');
          purchaseOrders.value = fetchedPurchaseOrders;
        } else {
          print('API request failed with status code: ${response.statusCode}');
          throw Exception('Failed to fetch orders');
        }
      } catch (e) {
        print('API request failed with error: $e');
        throw Exception('Failed to fetch orders: $e');
      }
    } else {
      // Handle the case when the user is not connected
      // You can show an error message or redirect to the login page
      print('User is not connected');
    }
  }
}

    /*void fetchPurchaseOrders() {
    PurchaseOrder purchaseOrder1 = PurchaseOrder(
      commandReference: 'ABC123',
      Date: '10/05/22',
      Time: '15:54:00',
      userName: 'John Doe',
      userEmail: 'john.doe@example.com',
      items: [
        PurchaseItem(article: 'Item 7', quantity: 4, price: 8.0),
        PurchaseItem(article: 'Item 8', quantity: 5, price: 12.0),
      ],
    );
    PurchaseOrder purchaseOrder2 = PurchaseOrder(
      commandReference: 'DEF456',
      Date: '11/08/22',
      Time: '16:09:04',
      userName: 'Jane Smith',
      userEmail: 'jane.smith@example.com',
      items: [
        PurchaseItem(article: 'Item 7', quantity: 4, price: 8.0),
        PurchaseItem(article: 'Item 8', quantity: 5, price: 12.0),
        PurchaseItem(article: 'Item 3', quantity: 1, price: 3.0),
        PurchaseItem(article: 'Item 4', quantity: 2, price: 2.0),
      ],
    );
    PurchaseOrder purchaseOrder3 = PurchaseOrder(
      commandReference: 'YUEF456',
      Date: '12/01/23',
      Time: '12:30:08',
      userName: 'maryam oumami',
      userEmail: 'maryam@example.com',
      items: [
         PurchaseItem(article: 'Item 1', quantity: 55, price: 9.0),
        PurchaseItem(article: 'Item 2', quantity: 10, price: 10.0),
        PurchaseItem(article: 'Item 3', quantity: 1, price: 3.0),
        PurchaseItem(article: 'Item 4', quantity: 2, price: 2.0),
        PurchaseItem(article: 'Item 7', quantity: 4, price: 8.0),
        PurchaseItem(article: 'Item 8', quantity: 5, price: 12.0),
      ],
    );
    PurchaseOrder purchaseOrder4 = PurchaseOrder(
      commandReference: 'DEF456',
      userName: 'Jane Smith',
      Date: '15/06/22',
      Time: '15:00:00',
      userEmail: 'jane.smith@example.com',
      items: [
        PurchaseItem(article: 'Item 11', quantity: 4, price: 8.0),
      ],
    );
    addPurchaseOrder(purchaseOrder1);
    addPurchaseOrder(purchaseOrder2);
    addPurchaseOrder(purchaseOrder3);
    addPurchaseOrder(purchaseOrder4);

  }*/
