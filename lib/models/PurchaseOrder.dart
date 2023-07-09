class PurchaseOrder {
  final String commandReference;
  final String userName;
  final String userEmail;
  final String Date;
  final String Time;
  final List<PurchaseItem> items;

  PurchaseOrder({
    required this.commandReference,
    required this.userName,
    required this.userEmail,
    required this.Date,
    required this.Time,
    required this.items,
  });
}

class PurchaseItem {
  final String article;
  final int quantity;
  final double price;

  PurchaseItem({
    required this.article,
    required this.quantity,
    required this.price,
  });
}
