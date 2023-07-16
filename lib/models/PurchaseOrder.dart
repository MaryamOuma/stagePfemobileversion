import 'package:flutter_project/models/Item.dart';

class PurchaseOrder {
  final int id;
  final String code;
  final int userId;
  final String user_name;
  final String user_email;
  final String status;
  final String price;
  final String createdAt;
  final String updatedAt;
  final int departmentId;
  final List<Item> items;

  PurchaseOrder({
    required this.id,
    required this.code,
    required this.userId,
    required this.user_name,
    required this.user_email,
    required this.status,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.departmentId,
    required this.items,
  });

  factory PurchaseOrder.fromJson(Map<String, dynamic> json) {
    return PurchaseOrder(
      id: json['id'],
      code: json['code'],
      userId: json['user_id'],
      user_email: json['user_email'],
      user_name: json['user_name'],
      status: json['status'],
      price: json['price'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      departmentId: json['department_id'],
      items: List<Item>.from(json['items'].map((item) => Item.fromJson(item))),
    );
  }
}
