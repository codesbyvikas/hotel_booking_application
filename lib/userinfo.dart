class User {
  String id;
  final String name;
  final String email;
  final String phone;
  final String password;

  User({
    this.id = '',
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      };
}
