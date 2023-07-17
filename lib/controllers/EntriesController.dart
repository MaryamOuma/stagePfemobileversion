import 'package:get/get.dart';

import '../widgets/CommandRow.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../models/Command.dart';
import 'AuthController.dart';

class EntriesController extends GetxController {
  final RxList<Map<String, String>> rowData = <Map<String, String>>[].obs;

  // Function to add a new row
  void addCommandRow() {
    rowData.add({
      'article': '',
      'quantity': '',
    });
    int index = commandRows.length;
    commandRows.add(CommandRow(index: index));
    update();
  }

  final commandRows = <CommandRow>[].obs;
  final selectedRow = RxInt(-1);

  void removeCommandRow(int index) {
    commandRows.removeAt(index);
    update();
  }

  void selectRow(int index) {
    selectedRow.value = index;
  }

  bool isRowSelected(int index) {
    return selectedRow.value == index;
  }

  void updateRowValue(int index, String field, String? value) {
    rowData[index][field] =
        value ?? ''; // Use an empty string if the value is null
    update();
  }

  var commands = <dynamic>[].obs;
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
      fetchCommands(token);
    }
  }

  Future<void> fetchCommands(String token) async {
    if (token != null && token.isNotEmpty) {
      try {
        final response = await http.get(
          Uri.parse('http://localhost:8000/api/entries/index'),
          headers: {'Authorization': 'Bearer $token'},
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final fetchedCommands = data['commands'] as List<dynamic>;
          commands.value =
              fetchedCommands.map((json) => Command.fromJson(json)).toList();
        } else {
          throw Exception('Failed to fetch commands');
        }
      } catch (e) {
        throw Exception('Failed to fetch commands: $e');
      }
    } else {
      // Handle the case when the user is not connected
      // You can show an error message or redirect to the login page
      print('User is not connected');
    }
  }

  /* String formattedTimeDifference(DateTime createdAt) {
    final now = DateTime.now();
    final difference = now.difference(createdAt);
    if (difference.inDays > 0) {
      final formatter = DateFormat('MMMM d y');
      return formatter.format(createdAt);
    } else if (difference.inHours > 0) {
      return 'It\'s been ${difference.inHours} hours';
    } else if (difference.inMinutes > 0) {
      return 'It\'s been ${difference.inMinutes} minutes';
    } else {
      return 'Just now';
    }
  }*/
  String formattedTimeDifference(DateTime createdAt) {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    return timeago.format(now.subtract(difference));
  }
}