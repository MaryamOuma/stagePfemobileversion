import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/EntriesController.dart';

class CommandRow extends StatelessWidget {
  final int index;

  CommandRow({required this.index});

  @override
  Widget build(BuildContext context) {
    EntriesController controller = Get.find();
    Map<String, String> row = controller.rowData[index];
    String? selectedArticle = row['article'];

    List<DropdownMenuItem<String>> dropdownItems = [
      DropdownMenuItem(value: 'Article 1', child: Text('Article 1')),
      DropdownMenuItem(value: 'Article 2', child: Text('Article 2')),
      DropdownMenuItem(value: 'Article 3', child: Text('Article 3')),
    ];

    if (selectedArticle != null &&
        !dropdownItems.any((item) => item.value == selectedArticle)) {
      // Add a DropdownMenuItem for the selected value if it doesn't exist in the items list
      dropdownItems.add(DropdownMenuItem(
          value: selectedArticle, child: Text(selectedArticle)));
    }

    return Obx(
      () => Container(
        color: controller.isRowSelected(index) ? Colors.red : null,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: DropdownButtonFormField<String>(
                value: selectedArticle,
                items: dropdownItems,
                onChanged: (value) {
                  controller.updateRowValue(index, 'article', value);
                },
                decoration: const InputDecoration(
                  labelText: 'Article',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              flex: 3,
              child: TextFormField(
                initialValue: row['quantity'],
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  controller.updateRowValue(index, 'quantity', value);
                },
                decoration: const InputDecoration(
                  labelText: 'Quantity',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.red),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
