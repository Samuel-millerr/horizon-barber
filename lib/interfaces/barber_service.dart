class BarberService {
  final String title;
  final String price;
  final String schedulingTime;

  BarberService({
    required this.title,
    required this.price,
    required this.schedulingTime,
  });

  factory BarberService.fromJson(Map<String, dynamic> json) {
    return BarberService(
      title: json["title"] ?? "",
      price: json["price"] ?? "",
      schedulingTime: json["schedulingTime"] ?? "",
    );
  }
}
