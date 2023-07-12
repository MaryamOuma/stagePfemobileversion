import 'package:get/get.dart';

import '../widgets/ExitCommandRow.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ExitsController extends GetxController {
  final RxList<Map<String, String>> rowData = <Map<String, String>>[].obs;

  // Function to add a new row
  void addCommandRow() {
    rowData.add({
      'article': '',
      'quantity': '',
    });
    int index = commandRows.length;
    commandRows.add(ExitCommandRow(index: index));
    update();
  }

  final commandRows = <ExitCommandRow>[].obs;
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
  @override
  void onInit() {
    super.onInit();
    fetchCommands();
  }

  Future<void> fetchCommands() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:8000/api/exits/index'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final fetchedCommands = data['commands'];
        commands.value = fetchedCommands;
      } else {
        throw Exception('Failed to fetch commands');
      }
    } catch (e) {
      throw Exception('Failed to fetch commands: $e');
    }
  }
}
