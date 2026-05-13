class UserInterface {
  final String fullName;
  final String number;
  final String photoUrl;

  UserInterface({
    required this.fullName,
    required this.number,
    required this.photoUrl,
  });

  factory UserInterface.fromJson(Map<String, dynamic> json) {
    return UserInterface(
      fullName: json["fullName"],
      number: "number",
      photoUrl: json["photoUrl"],
    );
  }
}

class UserFullInterface {
  final String fullName;
  final String password;
  final String number;
  final String? photoUrl;

  UserFullInterface({
    required this.fullName,
    required this.password,
    required this.number,
    this.photoUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "password": password,
      "number": number,
      "photoUrl": photoUrl,
    };
  }
}
