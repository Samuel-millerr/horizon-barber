class UserInterface {
  final String username;
  final String password;
  final String number;
  final String? photoUrl;

  UserInterface({
    required this.username,
    required this.password,
    required this.number,
    this.photoUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
      "number": number,
      "photoUrl": photoUrl,
    };
  }
}