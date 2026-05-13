import "package:flutter/foundation.dart";
import "package:horizon_barber/interfaces/barber_service_interface.dart";

class ApiService {
  ApiService._();

  static Future<void> login({
    required String userName,
    required String password,
  }) async {
    final body = {"user_name": userName, "password": password};

    debugPrint("Enviando login para API: $body");
    await Future<void>.delayed(const Duration(milliseconds: 400));
  }

  static Future<void> createAppointment({
    required String userName,
    required BarberServiceInterface service,
  }) async {
    final body = {
      "user_name": userName,
      "service_id": service.id,
      "service_name": service.name,
    };

    debugPrint("Enviando agendamento para API: $body");
    await Future<void>.delayed(const Duration(milliseconds: 400));
  }
}
