class Command {
  final String code;
  final DateTime createdAt;
  final int articlesCount;
  final String userName;
  final String price;
  final String status;
  final String department;

  Command({
    required this.code,
    required this.createdAt,
    required this.articlesCount,
    required this.userName,
    required this.price,
    required this.status,
    required this.department,
  });

  factory Command.fromJson(Map<String, dynamic> json) {
    return Command(
      code: json['code'],
      createdAt: DateTime.parse(json['created_at']),
      articlesCount: json['articles_count'],
      userName: json['user_name'],
      price: json['price'],
      status: json['status'],
      department: json['department_name'],
    );
  }
}
