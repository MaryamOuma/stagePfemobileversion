import 'package:flutter_project/models/item.dart';

class Command {
  final String code;
  final int id;
  final DateTime createdAt;
  final int articlesCount;
  final String userName;
  final String? userProfile;
  final String? userEmail;
  final String price;
  final String status;
  final String department;
  final String? supplier;
  final String? family;
  final List<Item>? items;

  Command({
    required this.code,
    required this.id,
    required this.createdAt,
    required this.articlesCount,
    required this.userName,
    required this.userEmail,
    required this.userProfile,
    required this.price,
    required this.status,
    required this.department,
    required this.supplier,
    required this.family,
    this.items,
  });

  factory Command.fromJson(Map<String, dynamic> json) {
    return Command(
      id: json['id'],
      supplier: json['supplier'],
      family: json['family'],
      code: json['code'],
      createdAt: DateTime.parse(json['created_at']),
      articlesCount: json['articles_count'],
      userName: json['user_name'],
      userProfile: json['user_profil'],
      userEmail: json['user_email'],
      price: json['price'],
      status: json['status'],
      department: json['department_name'],
      items: json.containsKey('items')
          ? List<Item>.from(json['items'].map((item) => Item.fromJson(item)))
          : null,
    );
  }
}
