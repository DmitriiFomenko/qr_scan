class User {
  const User({
    required this.login,
    required this.password,
    required this.email,
    required this.phone,
    required this.dateBirth,
    this.imageUrl,
    this.imagePath,
  });

  final String login;
  final String password;
  final String email;
  final String phone;
  final String dateBirth;
  final String? imageUrl;
  final String? imagePath;

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'password': password,
      'email': email,
      'phone': phone,
      'dateBirth': dateBirth,
      'imageUrl': imageUrl,
      'imagePath': imagePath,
    };
  }

  factory User.fromJsonImageUrl(Map<String, dynamic> json) {
    return User(
      login: json['login'] ?? '',
      password: json['password'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      dateBirth: json['dateBirth'] ?? '',
      imageUrl: json['image']['url'] ?? '',
    );
  }

  factory User.fromJsonImageLocal(Map<String, dynamic> json) {
    return User(
      login: json['login'] ?? 'Name',
      password: json['password'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      dateBirth: json['dateBirth'] ?? '',
      imagePath: json['imagePath'] ?? '',
    );
  }

  @override
  String toString() {
    return 'User(login: $login, password: $password, email: $email, phone: $phone, dateBirth: $dateBirth, imagePath: $imagePath, imageUrl: $imageUrl)';
  }
}
