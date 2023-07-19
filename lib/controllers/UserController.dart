import 'dart:convert';

import 'package:flutter_project/models/user.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  final user = User(
    id: 0,
    name: '',
    email: '',
    department: '',
    profil: '',
    superuser: '',
    image: '',
  ).obs;
  final isLoading = true.obs;
  final RxString authToken = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAuthToken();
  }

  Future<void> fetchAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authToken');
    //final email = prefs.getString('userEmail');
    if (token != null) {
      authToken.value = token;
      print('token not null');
      fetchUser(token);
    } else {
      print('token is null');
    }
  }

  Future<void> fetchUser(String token) async {
    if (token != null && token.isNotEmpty) {
      try {
        // Clear the user data before fetching the new user's data
        user.value = User(
          id: 0,
          name: '',
          email: '',
          department: '',
          profil: '',
          superuser: '',
          image: '',
        );
        final response = await http.get(
          Uri.parse('http://localhost:8000/api/user'),
          headers: {'Authorization': 'Bearer $token'},
        );

        if (response.statusCode == 200) {
          final userData = json.decode(response.body);
          user.value = User.fromJson(userData);
          print('Logged-in user: ${user.value.name}');
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
      print('Invalid token ');
    }
  }
}