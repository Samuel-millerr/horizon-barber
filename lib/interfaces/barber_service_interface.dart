class BarberServiceInterface {
  final int id;
  final String name;
  final String description;
  final double price;
  final int durationMinutes;
  final String icon;

  BarberServiceInterface({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.durationMinutes,
    required this.icon,
  });

  factory BarberServiceInterface.fromJson(Map<String, dynamic> json) {
    return BarberServiceInterface(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      price: json["price"] ?? "",
      durationMinutes: json["duration_minutes"] ?? 0,
      icon: json["icon"] ?? "",
    );
  }
}
