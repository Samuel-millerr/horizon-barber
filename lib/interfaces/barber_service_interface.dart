class BarberServiceInterface {
  final String title;
  final String price;
  final String schedulingTime;

  BarberServiceInterface({
    required this.title,
    required this.price,
    required this.schedulingTime,
  });

  factory BarberServiceInterface.fromJson(Map<String, dynamic> json) {
    return BarberServiceInterface(
      title: json["title"] ?? "",
      price: json["price"] ?? "",
      schedulingTime: json["schedulingTime"] ?? "",
    );
  }
}
