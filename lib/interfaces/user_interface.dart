class UserInterface {
  final String username;
  final String password;
  final String number;
  final String? photoUrl;
  final String? createdAt;

  UserInterface({
    required this.username,
    required this.password,
    required this.number,
    this.photoUrl,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
      "number": number,
      "photoUrl": photoUrl,
    };
  }

  factory UserInterface.fromJson(Map<String, dynamic> json) {
    return UserInterface(
      username: json["username"] ?? "",
      password: json["password"] ?? "",
      number: json["number"] ?? "",
      photoUrl: json["photoUrl"],
      createdAt: json["created_at"],
    );
  }
}
