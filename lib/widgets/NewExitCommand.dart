import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/ExitsController.dart';

class AddCommandModal extends StatelessWidget {
  final ExitsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Command',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.commandRows.length,
                itemBuilder: (context, index) {
                  final commandRow = controller.commandRows[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        ExitsController controller = Get.find();
                        int index = controller.commandRows.indexOf(commandRow);
                        controller.removeCommandRow(index);
                      },
                      background: Container(
                        alignment: Alignment.centerRight,
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: commandRow,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  onPressed: () {
                    controller.addCommandRow();
                  },
                  child: Text('Add Article'),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    // Save button action
                  },
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
