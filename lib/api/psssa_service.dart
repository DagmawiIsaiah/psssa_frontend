import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';
import '../utils/utils.dart';

class PsssaService {
  String productionAPI = devAPI;

  Future<Response> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$productionAPI/login"),
        body: {"username": username, "password": password},
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      );

      final json = jsonDecode(response.body);

      final token = json["token"];
      final user = json["user"];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", token);
      await prefs.setString("user", jsonEncode(user));

      return response;
    } catch (e) {
      return http.Response(
        "",
        HttpStatus.unauthorized,
        request: null,
        headers: {},
        isRedirect: false,
        persistentConnection: false,
        reasonPhrase: "Unauthorized",
      );
    }
  }

  Future<void> createUser(Map<String, dynamic> userData) async {
    final url = Uri.parse('$productionAPI/user/create');

    final pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");

    // Check if token exists
    if (token == null) {
      throw 'Token is missing';
    }

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(userData), // Convert Map to JSON
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        debugPrint('User created: $jsonResponse');
      } else if (response.statusCode == 400) {
        debugPrint('Bad request: ${response.body}');
        throw Exception('Bad request: ${response.body}');
      } else {
        debugPrint('Error: ${response.statusCode}');
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
      throw Exception('Error: $e');
    }
  }

  Future<List<dynamic>> getCurrentUser() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString('token') ?? '';
    String jsonString = pref.getString('user') ?? '';
    Map<String, dynamic> userMap = jsonDecode(jsonString);
    return [User.fromJson(userMap), token];
  }

  Future<String> createRecord(Map<String, dynamic> record) async {
    final url = Uri.parse('$productionAPI/record/create');

    final pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");

    // Check if token exists
    if (token == null) {
      throw 'Token is missing';
    }

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(record), // Convert RecordCreate object to JSON
      );

      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 400) {
        throw Exception('Bad request: ${response.body}');
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
      throw Exception('Error: $e');
    }
  }

  Future<List<User>> getUsers() async {
    final url =
        Uri.parse('$productionAPI/user'); // Adjust the endpoint if needed

    final pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");

    // Check if token exists
    if (token == null) {
      throw 'Token is missing';
    }

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        // Map the JSON response to a list of User objects
        return jsonResponse.map((json) => User.fromJson(json)).toList();
      } else if (response.statusCode == 404) {
        debugPrint('No users found');
        throw Exception('No users found');
      } else {
        debugPrint('Error: ${response.statusCode}');
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
      throw Exception('Error: $e');
    }
  }

  Future<void> updatePassword(int userId, String newPassword) async {
    final url = Uri.parse('$productionAPI/user/update_password');

    final pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");

    // Check if token exists
    if (token == null) {
      throw 'Token is missing';
    }

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'user_id': userId,
          'new_password': newPassword,
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        debugPrint('Password updated for user: ${jsonResponse['name']}');
      } else if (response.statusCode == 404) {
        throw Exception('User not found');
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
      throw Exception('Error: $e');
    }
  }

  Future<Record> fetchRecord({
    required String pentionNumber,
  }) async {
    final String baseUrl = "$productionAPI/record/$pentionNumber";

    final Uri uri = Uri.parse(baseUrl);

    final pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");

    try {
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Record.fromJson(data);
      } else if (response.statusCode == 404) {
        throw ("No records found");
      } else {
        throw ('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw ('Error: $e');
    }
  }

  Future<void> updateRecordStatus(int id, int newStatus) async {
    final url = Uri.parse('$productionAPI/record/update/');
    debugPrint(newStatus.toString());

    final pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");

    // Check if token exists
    if (token == null) {
      throw 'Token is missing';
    }

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'id': id,
          'new_status': newStatus,
        }),
      );

      if (response.statusCode == 200) {
        // Parse the response if needed
        final jsonResponse = jsonDecode(response.body);
        debugPrint('Record updated: $jsonResponse');
      } else if (response.statusCode == 404) {
        debugPrint('Record not found');
        throw Exception('Record not found');
      } else {
        debugPrint('Error: ${response.statusCode}');
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
      throw Exception('Error: $e');
    }
  }
}
