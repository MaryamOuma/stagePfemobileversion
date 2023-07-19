import 'dart:convert';
import 'package:flutter_project/controllers/user_controller.dart';
import 'package:flutter_project/views/IntroPage.dart';
import 'package:flutter_project/views/WelcomeBack.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../views/home.dart';
import '../views/login/login.dart';

class AuthController extends GetxController {
  final RxString authToken = ''.obs;

  // Method to call the login API
  Future<void> login(String email, String password, bool rememberMe) async {
    try {
      const url =
          "http://localhost:8000/api/login"; // Replace with your actual API endpoint

      try {
        final response = await http.post(
          Uri.parse(url),
          body: {'email': email, 'password': password},
        );

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          final user = responseData['user'];
          final token = responseData['token'];
          // Store the token in the authToken variable
          authToken.value = token;
          final message = responseData['message'];
          // Save the token in shared preferences
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('authToken', token);
          // Set rememberMe value
          // Create custom headers with the token
          final headers = {'Authorization': 'Bearer $token'};
          UserController controller = Get.put(UserController());
          // If login is successful, call fetchUser to fetch the new user's data
          await controller.fetchUser(authToken.value);
          // Redirect to the home screen or perform any other logic
          Get.to(() => IntroPage()); // Navigates to HomeView
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

  Future<void> logout() async {
    const url =
        'http://localhost:8000/api/logout'; // Replace with your actual logout API endpoint

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('authToken');
      final response = await http.post(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      );
      print('Logout successful');
      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        prefs.clear();
        print(prefs.getString(
            'authToken')); // Clear all data stored in shared preferences
        Get.offAll(() => WelcomeBackPage()); // Navigate to the login page
      } else {
        // Handle logout error
        final responseData = json.decode(response.body);
        final error = responseData['error'];
        print('Logout Error: $error');
        Get.snackbar(
          'Logout Error',
          error,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      // Handle API call error
      print('Logout Error: $e');
      Get.snackbar(
        'Logout Error',
        'An error occurred during logout.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
