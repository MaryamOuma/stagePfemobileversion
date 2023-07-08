import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/purchaseOrderController.dart';
import '../../models/purchaseorder.dart';

class PurchaseOrdersPage extends GetView<PurchaseOrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase Orders'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.purchaseOrders.length,
          itemBuilder: (context, index) {
            PurchaseOrder purchaseOrder = controller.purchaseOrders[index];
            return PurchaseOrderCard(
              purchaseOrder: purchaseOrder,
            );
          },
        ),
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
            child: Text(
              purchaseOrder.commandReference,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('To: ${purchaseOrder.userName}'),
                Text(purchaseOrder.userEmail),
              ],
            ),
          ),
          DataTable(
            columns: const [
              DataColumn(label: Text('Article')),
              DataColumn(label: Text('Quantity')),
              DataColumn(label: Text('Price')),
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
        ],
      ),
    );
  }
}