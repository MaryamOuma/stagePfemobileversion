class Article {
  final String? reference;
  final String? name;
  final DateTime? premptionDate;
  final String price;
  final bool? critical;
  final bool? active;
  final String? managingType;
  final int? threshold;
  final String? barcode;
  final int? supplierId;
  final int? familyId;
  final int? quantity;
  final DateTime? expirationDate;

  Article({
    required this.reference,
    required this.name,
    this.premptionDate,
    required this.price,
    required this.critical,
    required this.active,
    required this.managingType,
    required this.threshold,
    this.barcode,
    this.supplierId,
    this.familyId,
    required this.quantity,
    this.expirationDate,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      reference: json['reference'],
      name: json['name'],
      premptionDate: json['premption_date'] != null
          ? DateTime.parse(json['premption_date'])
          : null,
      price:
          json['price'].toString(), // Make sure the price is parsed as a string
      critical: json['critical'] == 1, // Convert the critical value to a bool
      active: json['active'] == 1, // Convert the active value to a bool
      managingType: json['managing_type'],
      threshold: int.parse(
          json['threshold'].toString()), // Parse the threshold as an int
      barcode: json['barcode'],
      supplierId: json['supplier_id'],
      familyId: json['family_id'],
      quantity: json['quantity'],
      expirationDate: json['expiration_date'] != null
          ? DateTime.parse(json['expiration_date'])
          : null,
    );
  }
}
