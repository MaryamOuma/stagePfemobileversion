import 'package:flutter/material.dart' hide NavigationDrawer;
import 'package:flutter_project/views/navigation_drawer.dart';
import 'package:get/get.dart';

import '../../models/purchaseorder.dart';
import '../controllers/PurchaseOrderController.dart';
import 'bottom_navigation_helper.dart';
import 'navigation_drawer.dart';

class Orders extends GetView<PurchaseOrderController> {
  final PurchaseOrderController controller = Get.put(PurchaseOrderController());

  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          title: Text('Purchase Orders'),
        ),
        bottomNavigationBar: handleBottomNavigationBar(3),
        body: Obx(
        () {
          /*print('Rebuilding ListView...');
          if (controller.purchaseOrders.isEmpty) {
            print('Purchase Orders list is empty.');
          } else {
            print(
                'Purchase Orders list length: ${controller.purchaseOrders.length}');
          }*/

          return ListView.builder(
            itemCount: controller.purchaseOrders.length,
            itemBuilder: (context, index) {
              PurchaseOrder purchaseOrder = controller.purchaseOrders[index];
              // print('Building PurchaseOrderCard for index $index...');
              return PurchaseOrderCard(
                purchaseOrder: purchaseOrder,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show dialog or navigate to create a new purchase order
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class PurchaseOrderCard extends StatelessWidget {
  final PurchaseOrder purchaseOrder;

  const PurchaseOrderCard({
    Key? key,
    required this.purchaseOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  purchaseOrder.commandReference,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'To: ${purchaseOrder.userName}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${purchaseOrder.userEmail}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${purchaseOrder.Date} ${purchaseOrder.Time}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          DataTable(
            columns: const [
              DataColumn(label: Text('Article')),
              DataColumn(label: Text('Quantity')),
              DataColumn(label: Text('Subtotal')),
            ],
            rows: purchaseOrder.items.map<DataRow>((item) {
              return DataRow(
                cells: [
                  DataCell(Text(item.article)),
                  DataCell(Text(item.quantity.toString())),
                  DataCell(Text(item.price.toString())),
                ],
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Generate Excel
                  },
                  child: Text('Generate Excel'),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Generate PDF
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey),
                  ),
                  child: Text('Generate PDF'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
