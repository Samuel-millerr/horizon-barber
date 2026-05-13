import "dart:convert";

import "package:flutter/foundation.dart";
import "package:horizon_barber/interfaces/barber_service_interface.dart";
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = "http://localhost:8000";
  ApiService._();

  static Future<void> login({
    required String userName,
    required String password,
  }) async {
    final body = {"user_name": userName, "password": password};

    debugPrint("Enviando login para API: $body");
    await Future<void>.delayed(const Duration(milliseconds: 400));
  }

  static Future<Map<String, dynamic>> register({
    required Map<String, dynamic> user,
  }) async {
    try {
      final url = Uri.parse("$_baseUrl/users");

      final response = await http.post(
        url,
        headers: {
          'Content-Type':
              'application/json', // Informa à API que estamos enviando JSON
        },
        body: jsonEncode(user),
      );

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 201) {
        return {"success": true, "message": responseData};
      } else {
        return {
          "success": false,
          "message": responseData['detail'] ?? "Erro desconhecido",
        };
      }
    } catch (e) {
      return {"success": false, "message": "Falha na conexão com o servidor."};
    }
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
