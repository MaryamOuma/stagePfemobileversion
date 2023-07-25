import 'dart:convert';
import 'package:flutter_project/models/ExitPurchaseOrder.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExitPurchaseOrderController extends GetxController {
  final purchaseOrders = <ExitPurchaseOrder>[].obs;
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
          Uri.parse('http://localhost:8000/api/index/exits/orders'),
          headers: {'Authorization': 'Bearer $token'},
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          //print('API response: $data');

          final purchaseOrdersData = data['purchase_info'] as List<dynamic>;

          final List<ExitPurchaseOrder> fetchedPurchaseOrders =
              purchaseOrdersData
                  .map((items) => ExitPurchaseOrder.fromJson(items))
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
