import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import '../views/home.dart';

class LoginController extends GetxController {
  // Method to call the login API
  Future<void> login(String email, String password) async {
    try {
      const url =
          "http://localhost:8000/api/login"; // Replace with your actual API endpoint

      try {
        final response = await http.post(
          Uri.parse(url),
          body: {'email': email, 'password': password},
        );

        if (response.statusCode == 200) {
          print('Success');
          final responseData = json.decode(response.body);
          final user = responseData['user'];
          final token = responseData['token'];
          final message = responseData['message'];
          print(message);
          print(token);

          // Process the received user and token data
          // For example, save them to GetX controllers or shared preferences

          // Redirect to the home screen or perform any other logic
          Get.to(() => Home()); // Navigates to HomeView
        } else if (response.statusCode == 422) {
          final responseData = json.decode(response.body);
          final error = responseData['error'];
          print("Validation Error");

          // Handle validation error
          Get.snackbar(
            'Error',
            error,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          final responseData = json.decode(response.body);
          final error = responseData['error'];
          print("Failure");

          // Handle authentication error
          Get.snackbar(
            'Error',
            error,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } catch (e) {
        print('Exception occurred during API call: $e');
      }
    } catch (e) {
      print('Exception occurred during login: $e');
      // Handle the exception as per your requirements
    }
  }
}
