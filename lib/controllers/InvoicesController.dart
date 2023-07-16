import 'dart:convert';

import 'package:flutter_project/models/Invoice.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class InvoicesController extends GetxController {
  final invoices = <Invoice>[].obs;
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
      fetchInvoices(token);
    }
  }

  Future<void> fetchInvoices(String token) async {
    if (token != null && token.isNotEmpty) {
      try {
        final response = await http.get(
          Uri.parse('http://localhost:8000/api/invoices'),
          headers: {'Authorization': 'Bearer $token'},
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);

          final List<dynamic> invoicesData = data as List<dynamic>;

          final List<Invoice> fetchedInvoices =
              invoicesData.map((invoice) => Invoice.fromJson(invoice)).toList();
          print('$fetchedInvoices');
          invoices.value = fetchedInvoices;
        } else {
          print('API request failed with status code: ${response.statusCode}');
          throw Exception('Failed to fetch invoices');
        }
      } catch (e) {
        print('API request failed with error: $e');
        throw Exception('Failed to fetch invoices: $e');
      }
    } else {
      print('User is not connected');
    }
  }
}
