class Invoice {
  final String commandReference;
  final String userName;
  final String userEmail;
  final String status;
  final String? date;  
  final double Total;
  final double RemainingAmount;
  final List<InvoiceItem> items;

  Invoice({
    required this.commandReference,
    required this.userName,
    required this.userEmail,
    required this.status,
    required this.date,
    required this.RemainingAmount,
    required this.Total,
    required this.items,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    final List<dynamic> itemsData = json['items'] as List<dynamic>;

    final List<InvoiceItem> invoiceItems =
        itemsData.map((item) => InvoiceItem.fromJson(item)).toList();

    return Invoice(
      commandReference: json['commandReference'],
      userName: json['user_name'],
      status: json['invoice']['status'],
      userEmail: json['user_email'],
      date: json['invoice']['created_at'],
      Total: double.parse(json['total']),
      RemainingAmount: json['invoice']['remaining_amount'],
      items: invoiceItems,
    );
  }
}

class InvoiceItem {
  final String article;
  final int quantity;
  final double subtotal;

  InvoiceItem({
    required this.article,
    required this.quantity,
    required this.subtotal,
  });

  factory InvoiceItem.fromJson(Map<String, dynamic> json) {
    return InvoiceItem(
      article: json['article'],
      quantity: json['quantity'],
      subtotal: json['subtotal'].toDouble(),
    );
  }
}