class Invoice {
  final String commandReference;
  final String userName;
  final String userEmail;
  final String Date;
  final double Total;
  final String Time;
  final List<InvoiceItem> items;

  Invoice({
    required this.commandReference,
    required this.userName,
    required this.userEmail,
    required this.Date,
    required this.Total,
    required this.Time,
    required this.items,
  });
}

class InvoiceItem {
  final String article;
  final int quantity;
  final double price;

  InvoiceItem({
    required this.article,
    required this.quantity,
    required this.price,
  });
}
