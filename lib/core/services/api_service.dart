import "dart:convert";

import "package:flutter/foundation.dart";
import "package:horizon_barber/interfaces/barber_service_interface.dart";
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = "http://localhost:8000";
  ApiService._();

  static Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    try {
      final url = Uri.parse("$_baseUrl/users/login");
      final body = jsonEncode({"username": username, "password": password});

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
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

  static Future<Map<String, dynamic>> register({
    required Map<String, dynamic> user,
  }) async {
    try {
      final url = Uri.parse("$_baseUrl/users/register");

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
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

  static Future<Map<String, dynamic>> getCurrentUser(final username) async {
    final url = Uri.parse("$_baseUrl/users?username=$username");
    final response = await http.get(url);
    final responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return {"success": true, "message": responseData};
    } else {
      return {
        "success": false,
        "message": responseData['detail'] ?? "Erro desconhecido",
      };
    }
  }

  static Future<Map<String, dynamic>> getBarberServices() async {
    final url = Uri.parse("$_baseUrl/barber-services");
    final response = await http.get(url);
    final responseData = jsonDecode(response.body);

    return {"success": true, "message": responseData};
  }

  static Future<Map<String, dynamic>> createAppointment({
    required String username,
    required BarberServiceInterface service,
    required String observation,
  }) async {
    try {
      final url = Uri.parse("$_baseUrl/appointments");
      final body = jsonEncode({
        "username": username,
        "service_id": service.id,
        "observation": observation,
      });

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      await Future<void>.delayed(const Duration(milliseconds: 400));
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

  static Future<Map<String, dynamic>> getAppointmentByCurrentUser(
    final username,
  ) async {
    try {
      final url = Uri.parse("$_baseUrl/appointments?username=$username");

      final response = await http.get(url);

      final responseData = jsonDecode(response.body);

      await Future<void>.delayed(const Duration(milliseconds: 400));
      if (response.statusCode == 200) {
        return {"success": true, "message": responseData};
      } else {
        return {"success": false, "message": responseData["detail"]};
      }
    } catch (e) {
      return {"success": false, "message": "Falha na conexão com o servidor."};
    }
  }

  static Future<void> deleteAppointment(final id) async {
    try {
      final url = Uri.parse("$_baseUrl/appointments/$id");

      await http.delete(url);

      return;
    } catch (e) {
      print(e);
      return;
    }
  }
}
