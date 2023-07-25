class ExitInvoice {
  final String commandReference;
  final String userName;
  final String userEmail;
  final String clientName;
  final String clientEmail;
  final String status;
  final DateTime date;
  final double Total;
  final double RemainingAmount;
  final List<InvoiceItem> items;

  ExitInvoice({
    required this.commandReference,
    required this.userName,
    required this.userEmail,
    required this.clientName,
    required this.clientEmail,
    required this.status,
    required this.date,
    required this.Total,
    required this.RemainingAmount,
    required this.items,
  });

  factory ExitInvoice.fromJson(Map<String, dynamic> json) {
    final List<dynamic> itemsData = json['items'] as List<dynamic>;

    final List<InvoiceItem> invoiceItems =
        itemsData.map((item) => InvoiceItem.fromJson(item)).toList();

    return ExitInvoice(
      commandReference: json['commandReference'],
      userName: json['user_name'],
      clientName: json['client_name'],
      clientEmail: json['client_email'],
      status: json['invoice']['status'],
      userEmail: json['user_email'],
      date: DateTime.parse(json['invoice']['created_at']),
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
