class User {
  final int id;
  final String name;
  final String email;
  final String department;
  final String profil;
  final String superuser;
  final String image;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.department,
    required this.profil,
    required this.superuser,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      department: json['department'],
      profil: json['profil'],
      superuser: json['superuser'],
      image: json['image'],
    );
  }
}