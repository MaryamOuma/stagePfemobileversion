import 'package:flutter_project/models/Item.dart';

class ExitCommand {
  final String code;
  final int id;
  final DateTime createdAt;
  final int articlesCount;
  final String userName;
  final String? userProfile;
  final String? userEmail;
  final String? clientName;
  final String? clientEmail;
  final String? comment;
  final String price;
  final String status;
  final List<Item>? items;

  ExitCommand({
    required this.code,
    required this.id,
    required this.createdAt,
    required this.articlesCount,
    required this.userName,
    required this.userEmail,
    required this.userProfile,
    required this.clientName,
    required this.clientEmail,
    required this.comment,
    required this.price,
    required this.status,
    this.items,
  });

  factory ExitCommand.fromJson(Map<String, dynamic> json) {
    return ExitCommand(
      id: json['id'],
      code: json['code'],
      createdAt: DateTime.parse(json['created_at']),
      articlesCount: json['articles_count'],
      userName: json['user_name'],
      userProfile: json['user_profil'],
      userEmail: json['user_email'],
      clientName: json['client_name'],
      clientEmail: json['client_email'],
      price: json['price'],
      status: json['status'],
      comment: json['comment'],
      items: json.containsKey('items')
          ? List<Item>.from(json['items'].map((item) => Item.fromJson(item)))
          : null,
    );
  }
}
