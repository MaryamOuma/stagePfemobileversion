import 'package:flutter_project/models/Invoice.dart';
import 'package:get/get.dart';

class InvoicesController extends GetxController {
  final RxList<Invoice> Invoices = <Invoice>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchInvoices();
  }

  void addInvoice(Invoice Invoice) {
    Invoices.add(Invoice);
  }

  void removeInvoice(int index) {
    Invoices.removeAt(index);
  }

  void fetchInvoices() {
    // Fetch Invoice orders from API or database
    // ...

    // For testing purposes, let's add dummy data
    Invoice Invoice1 = Invoice(
      commandReference: 'ABC123',
      Date: '10/05/22',
      Total: 123.5,
      Time: '15:54:00',
      userName: 'John Doe',
      userEmail: 'john.doe@example.com',
      items: [
        InvoiceItem(article: 'Item 1', quantity: 2, price: 10.0),
        InvoiceItem(article: 'Item 2', quantity: 3, price: 15.0),
      ],
    );
    Invoice Invoice2 = Invoice(
      commandReference: 'DEF456',
      Date: '11/08/22',
      Time: '16:09:04',
      Total: 12300,
      userName: 'Jane Smith',
      userEmail: 'jane.smith@example.com',
      items: [
        InvoiceItem(article: 'Item 3', quantity: 1, price: 8.0),
        InvoiceItem(article: 'Item 4', quantity: 5, price: 12.0),
      ],
    );
    Invoice Invoice3 = Invoice(
      commandReference: 'YUEF456',
      Date: '12/01/23',
      Time: '12:30:08',
      Total: 123.5,
      userName: 'maryam oumami',
      userEmail: 'maryam@example.com',
      items: [
        InvoiceItem(article: 'Item 5', quantity: 1, price: 8.0),
        InvoiceItem(article: 'Item 6', quantity: 10, price: 12.0),
      ],
    );
    Invoice Invoice4 = Invoice(
      commandReference: 'DEF456',
      userName: 'Jane Smith',
      Date: '15/06/22',
      Total: 55500,
      Time: '15:00:00',
      userEmail: 'jane.smith@example.com',
      items: [
        InvoiceItem(article: 'Item 7', quantity: 4, price: 8.0),
        InvoiceItem(article: 'Item 8', quantity: 5, price: 12.0),
      ],
    );
    addInvoice(Invoice1);
    addInvoice(Invoice2);
    addInvoice(Invoice3);
    addInvoice(Invoice4);
  }
}
