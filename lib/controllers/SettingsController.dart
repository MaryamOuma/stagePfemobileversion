import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_bcrypt/flutter_bcrypt.dart';

class SettingsController extends GetxController {
  // Add your state variables and methods here
  RxString currentPassword = ''.obs;
  RxString newPassword = ''.obs;
  RxString retypeNewPassword = ''.obs;
  final isLoading = true.obs;
  final RxString authToken = ''.obs;

  String usersCurrentPassword = '';

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
      fetchCurrentUserPassword(token);
    }
  }

  Future<void> fetchCurrentUserPassword(String token) async {
    if (token != null && token.isNotEmpty) {
      try {
        // Clear the user data before fetching the new user's data
        usersCurrentPassword = '';
        final response = await http.get(
          Uri.parse('http://localhost:8000/api/user/current-password'),
          headers: {'Authorization': 'Bearer $token'},
        );

        if (response.statusCode == 200) {
          usersCurrentPassword = response.body;
          print('Logged-in user current password: $usersCurrentPassword');
        } else {
          print('API request failed with status code: ${response.statusCode}');
          throw Exception('Failed to fetch user');
        }
      } catch (e) {
        print('API request failed with error: $e');
        throw Exception('Failed to fetch user: $e');
      } finally {
        isLoading.value = false;
      }
    } else {
      print('Invalid token');
    }
  }

  bool isPasswordMatching() {
    print("matching ??");
    return newPassword.value == retypeNewPassword.value;
  }

  Future<http.Response> changePassword(String token, String currentPassword, String newPassword) async {
    if (isPasswordMatching()) {
      print("yes matching");
      try {
        final url = Uri.parse('http://localhost:8000/api/user/change-password');
        final response = await http.post(
          url,
          headers: {'Authorization': 'Bearer $token'},
          body: {
            'current_password': currentPassword,
            'new_password': newPassword,
          },
        );

        if (response.statusCode == 200) {
          // Password changed successfully
          Get.snackbar(
            'Success',
            'Password changed',
            backgroundColor: Color.fromARGB(255, 88, 172, 107),
            colorText: Colors.white,
          );
          print('Password changed successfully');
          // You can show a success message or navigate to another screen
          return response;
        } else if (response.statusCode == 401) {
          // Incorrect password
          Get.snackbar(
            'Error',
            'Incorrect password',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          print('Incorrect current password');
          // Show an error message to the user
          return response;
        } else {
          // Other error handling
          print('Error: ${response.statusCode}');
          // Show an error message to the user
          return response;
        }
      } catch (e) {
        // Handle network or other errors
        print('Error: $e');
        // Show an error message to the user
      }
    }
    else {
        print("not matching");
        // Passwords do not match
        Get.snackbar(
          'Error',
          'Passwords do not match',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }

    return http.Response('', 500);
  }

}
