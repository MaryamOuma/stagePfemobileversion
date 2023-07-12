import 'package:flutter/material.dart' hide NavigationDrawer;
import 'package:flutter_project/views/navigation_drawer.dart';
import 'package:get/get.dart';

import '../../models/purchaseorder.dart';
import '../controllers/InvoicesController.dart';
import '../controllers/PurchaseOrderController.dart';
import '../models/invoice.dart';
import 'bottom_navigation_helper.dart';
import 'navigation_drawer.dart';

class Invoices extends GetView<InvoicesController> {
  final InvoicesController controller = Get.put(InvoicesController());

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: Text('Invoices'),
      ),
      bottomNavigationBar: handleBottomNavigationBar(0),
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
            itemCount: controller.Invoices.length,
            itemBuilder: (context, index) {
              Invoice invoice = controller.Invoices[index];
              // print('Building PurchaseOrderCard for index $index...');
              return InvoiceCard(
                invoice: invoice,
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

class InvoiceCard extends StatelessWidget {
  final Invoice invoice;

  const InvoiceCard({
    Key? key,
    required this.invoice,
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
                  invoice.commandReference,
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
                          'To: ${invoice.userName}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${invoice.userEmail}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${invoice.Date} ${invoice.Time}',
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
            rows: invoice.items.map<DataRow>((item) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 16.0),
                Text(
                  'More Information',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Total: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${invoice.Total}', // Replace with the actual value
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Generate Excel
                      },
                      child: Text('Generate Excel'),
                    ),
                    SizedBox(width: 8.0),
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
                    SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        // Generate PDF
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      child: Text('Payement'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
