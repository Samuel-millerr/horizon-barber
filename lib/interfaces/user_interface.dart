class UserInterface {
  final String fullName;
  final String number;
  final String photoUrl;
  final DateTime createdDate;

  UserInterface({
    required this.fullName,
    required this.number,
    required this.photoUrl,
    required this.createdDate,
  });

  factory UserInterface.fromJson(Map<String, dynamic> json) {
    return UserInterface(
      fullName: json["fullName"],
      number: "number",
      photoUrl: json["photoUrl"],
      createdDate: json["createdDate"],
    );
  }
}
