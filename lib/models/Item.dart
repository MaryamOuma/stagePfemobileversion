class Item {
  final int quantity;
  final int subtotal;
  final String article;

  Item({
    required this.quantity,
    required this.subtotal,
    required this.article,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      subtotal: json['subtotal'],
      quantity: json['quantity'],
      article: json['article'],
    );
  }
}
