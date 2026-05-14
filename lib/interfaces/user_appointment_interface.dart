class UserAppointmentInterface {
  final int id;
  final String serviceName;
  final String serviceIcon;
  final String barberName;
  final String observation;

  const UserAppointmentInterface({
    required this.id,
    required this.serviceName,
    required this.serviceIcon,
    required this.barberName,
    required this.observation,
  });

  factory UserAppointmentInterface.fromJson(Map<String, dynamic> json) {
    return UserAppointmentInterface(
      id: json["id"],
      serviceName: json[""],
      serviceIcon: json["service_name"],
      barberName: json["barber_name"],
      observation: json["observation"],
    );
  }
}
