import 'package:get/get.dart';
import '../models/purchaseorder.dart';

class PurchaseOrderController extends GetxController {
  final RxList<PurchaseOrder> purchaseOrders = <PurchaseOrder>[].obs;

  void addPurchaseOrder(PurchaseOrder purchaseOrder) {
    purchaseOrders.add(purchaseOrder);
  }

  void removePurchaseOrder(int index) {
    purchaseOrders.removeAt(index);
  }
}