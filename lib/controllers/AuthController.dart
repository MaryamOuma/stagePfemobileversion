import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/notification_controller.dart';
import 'package:flutter_project/controllers/user_controller.dart';
import 'package:flutter_project/views/IntroPage.dart';
import 'package:flutter_project/views/WelcomeBack.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../views/home.dart';
import '../views/login/login.dart';
import 'package:flutter_project/views/auth/confirm_otp_page.dart';
import 'package:flutter_project/views/auth/reset_password.dart';

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
          final int userId = responseData['user']['id'];

          // Store the user ID in shared preferences
          final pref = await SharedPreferences.getInstance();
          pref.setInt('user_id', userId);
          authToken.value = token;
          final message = responseData['message'];
          // Save the token in shared preferences
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('authToken', token);
          final email = await SharedPreferences.getInstance();
          prefs.setString('email', responseData['user']['email']);

          // Set rememberMe value
          // Create custom headers with the token
          final headers = {'Authorization': 'Bearer $token'};
          UserController controller = Get.put(UserController());
          NotificationController notifcontroller =
              Get.put(NotificationController());
          // If login is successful, call fetchUser to fetch the new user's data
          await controller.fetchUser(authToken.value);
          // Redirect to the home screen or perform any other logic
          Get.to(() => IntroPage(
              rememberMe: rememberMe, token: token)); // Navigates to HomeView
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
        final String notificationCountPrefix = 'notificationCount_';
        final String showIconMenuItemPrefix = 'showIconMenuItem_';
        final prefs = await SharedPreferences.getInstance();
        final keys = prefs.getKeys();
        for (String key in keys) {
          if (!key.startsWith(notificationCountPrefix) &&
              !key.startsWith(showIconMenuItemPrefix)) {
            prefs.remove(
                key); // Clear all preferences that do not have the notificationCount_ and showIconMenuItem_ prefixes
          }
        }
        print(prefs.getString(
            'remmeberMe')); // Clear all data stored in shared preferences
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

  Future<void> sendOTPCode(String email) async {
    try {
      // Call your API endpoint to send the OTP code to the provided email
      final url = Uri.parse('http://localhost:8000/api/request-otp');
      final response = await http.post(
        url,
        body: {'email': email},
      );
      if (response.statusCode == 200) {
        // OTP code sent successfully
        // You can show a success message or navigate to another screen
        print('OTP code sent successfully');
        Get.to(() => ConfirmOtpPage(
            email: email)); // Navigate to the OTP confirmation page
      } else if (response.statusCode == 404) {
        // Failed to send OTP code
        // Show an error message to the user
        print('Email not found');
        Get.snackbar(
          'Error',
          'Email not registered',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        // Failed to send OTP code
        // Show an error message to the user
        print('Failed to send OTP code');
        Get.snackbar(
          'Error',
          'Failed to send OTP code',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      // Handle network or other errors
      // Show an error message to the user
      print('Error: $e');
      Get.snackbar(
        'Error',
        'An error occurred',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // VERIFY OTP :

  Future<void> verifyOTP(String email, String otp) async {
    print(email);
    print(otp);
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/verify-otp'),
      body: {'email': email, 'otp': otp},
    );

    if (response.statusCode == 200) {
      Get.snackbar(
        'Success',
        'OTP verification successful',
        backgroundColor: Color.fromARGB(255, 72, 126, 60),
        colorText: Colors.white,
      );
      print('OTP verification successful');
      Get.to(() => ResetPasswordPage(email: email));
    } else if (response.statusCode == 400) {
      Get.snackbar(
        'Complete the code',
        'OTP code missing',
        backgroundColor: Color.fromARGB(255, 169, 180, 47),
        colorText: Colors.white,
      );
    } else if (response.statusCode == 401) {
      Get.snackbar(
        'Failed',
        'Invalid OTP',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      print('OTP verification failed: ${response.body}');
    }
  }

  // RESET PASSWORD :

  Future<void> resetPassword(String email, String newPassword) async {
    print(email);
    print(newPassword);

    try {
      final response = await http.post(
        Uri.parse('http://localhost:8000/api/reset-password'),
        body: {'email': email, 'password': newPassword},
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Password reset successfully',
          backgroundColor: Color.fromARGB(255, 72, 126, 60),
          colorText: Colors.white,
        );
        print('Password reset successful');
        Get.to(() => WelcomeBackPage());
      } else if (response.statusCode == 400) {
        Get.snackbar(
          'Failed',
          'Password must be at least 8 caracters',
          backgroundColor: Color.fromARGB(255, 169, 180, 47),
          colorText: Colors.white,
        );
        print('Password validation failed: ${response.body}');
      } else {
        Get.snackbar(
          'Failed',
          'Password reset failed, Try again',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        print('Password reset failed: ${response.body}');
        Get.to(() => WelcomeBackPage());
      }
    } catch (e) {
      // Error occurred while making the API call
      // Show an error message or handle the error appropriately
      print('Error: $e');
    }
  }
}
