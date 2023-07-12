import 'package:get/get.dart';
import '../models/purchaseorder.dart';

class PurchaseOrderController extends GetxController {
  final RxList<PurchaseOrder> purchaseOrders = <PurchaseOrder>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchPurchaseOrders();
  }

  void addPurchaseOrder(PurchaseOrder purchaseOrder) {
    purchaseOrders.add(purchaseOrder);
  }

  void removePurchaseOrder(int index) {
    purchaseOrders.removeAt(index);
  }

  void fetchPurchaseOrders() {
    // Fetch purchase orders from API or database
    // ...

    // For testing purposes, let's add dummy data
    PurchaseOrder purchaseOrder1 = PurchaseOrder(
      commandReference: 'ABC123',
      Date: '10/05/22',
      Time: '15:54:00',
      userName: 'John Doe',
      userEmail: 'john.doe@example.com',
      items: [
        PurchaseItem(article: 'Item 1', quantity: 2, price: 10.0),
        PurchaseItem(article: 'Item 2', quantity: 3, price: 15.0),
      ],
    );
    PurchaseOrder purchaseOrder2 = PurchaseOrder(
      commandReference: 'DEF456',
      Date: '11/08/22',
      Time: '16:09:04',
      userName: 'Jane Smith',
      userEmail: 'jane.smith@example.com',
      items: [
        PurchaseItem(article: 'Item 3', quantity: 1, price: 8.0),
        PurchaseItem(article: 'Item 4', quantity: 5, price: 12.0),
      ],
    );
    PurchaseOrder purchaseOrder3 = PurchaseOrder(
      commandReference: 'YUEF456',
      Date: '12/01/23',
      Time: '12:30:08',
      userName: 'maryam oumami',
      userEmail: 'maryam@example.com',
      items: [
        PurchaseItem(article: 'Item 5', quantity: 1, price: 8.0),
        PurchaseItem(article: 'Item 6', quantity: 10, price: 12.0),
      ],
    );
    PurchaseOrder purchaseOrder4 = PurchaseOrder(
      commandReference: 'DEF456',
      userName: 'Jane Smith',
      Date: '15/06/22',
      Time: '15:00:00',
      userEmail: 'jane.smith@example.com',
      items: [
        PurchaseItem(article: 'Item 7', quantity: 4, price: 8.0),
        PurchaseItem(article: 'Item 8', quantity: 5, price: 12.0),
      ],
    );
    addPurchaseOrder(purchaseOrder1);
    addPurchaseOrder(purchaseOrder2);
    addPurchaseOrder(purchaseOrder3);
    addPurchaseOrder(purchaseOrder4);
  }
}