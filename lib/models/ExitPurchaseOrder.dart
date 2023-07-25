import 'package:flutter_project/models/Item.dart';

class ExitPurchaseOrder {
  final String code;
  final int id;
  final DateTime createdAt;
  final String userName;
  final String? userProfile;
  final String? userEmail;
  final String? clientName;
  final String? clientEmail;
  final String? comment;
  final String price;
  final String status;
  final List<Item> items;

  ExitPurchaseOrder({
    required this.code,
    required this.id,
    required this.createdAt,
    required this.userName,
    required this.userEmail,
    required this.userProfile,
    required this.clientName,
    required this.clientEmail,
    required this.comment,
    required this.price,
    required this.status,
    required this.items,
  });

  factory ExitPurchaseOrder.fromJson(Map<String, dynamic> json) {
    return ExitPurchaseOrder(
      id: json['id'],
      code: json['code'],
      createdAt: DateTime.parse(json['created_at']),
      userName: json['user_name'],
      userProfile: json['user_profil'],
      userEmail: json['user_email'],
      clientName: json['client_name'],
      clientEmail: json['client_email'],
      price: json['price'],
      status: json['status'],
      comment: json['comment'],
      items: List<Item>.from(json['items'].map((item) => Item.fromJson(item))),
    );
  }
}
