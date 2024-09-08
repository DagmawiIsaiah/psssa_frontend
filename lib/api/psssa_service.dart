import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';
import '../utils/utils.dart';

class PsssaService {
  String productionAPI = prodAPI;

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

  Future<Record?> createRecord(Record record) async {
    final url = Uri.parse('$productionAPI/record/create');

    try {
      final pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer $token', // Include Bearer token for authentication
        },
        body: jsonEncode({
          "id": record.id,
          'region_id': record.regionId,
          'city_id': record.cityId,
          'category_id': record.categoryId,
          'status_id': record.statusId,
          'name': record.name,
          'pention_number': record.pentionNumber,
        }), // Convert the record data to JSON
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Parse the response and return the created record
        return Record.fromJson(jsonDecode(response.body));
      } else {
        // Handle the error
        debugPrint('Failed to create record: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Error occurred while creating record: $e');
      return null;
    }
  }

  Future<List<Record>> getRecords() async {
    final url =
        Uri.parse('$productionAPI/records'); // Adjust the endpoint as necessary

    try {
      final pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer $token', // Include Bearer token for authentication
        },
      );

      if (response.statusCode == 200) {
        // Parse the response and return the list of records
        List<dynamic> body = jsonDecode(response.body);
        List<Record> records =
            body.map((dynamic item) => Record.fromJson(item)).toList();
        return records;
      } else {
        // Handle the error
        debugPrint('Failed to load records: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      debugPrint('Error occurred while fetching records: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>> getEssentials() async {
    final categories = await getCategories();
    final cities = await getCities();
    final regions = await getRegions();

    return {
      "categories": categories,
      "cities": cities,
      "regions": regions,
    };
  }

  Future<List<Category>> getCategories() async {
    final response = await http.get(Uri.parse("$productionAPI/category"));
    final json = jsonDecode(response.body);
    final List<Category> categories = [];
    for (var item in json) {
      categories.add(Category.fromJson(item));
    }
    return categories;
  }

  Future<List<City>> getCities() async {
    final response = await http.get(Uri.parse("$productionAPI/city"));
    final json = jsonDecode(response.body);
    final List<City> cities = [];
    for (var item in json) {
      cities.add(City.fromJson(item));
    }
    return cities;
  }

  Future<List<Region>> getRegions() async {
    final response = await http.get(Uri.parse("$productionAPI/region"));
    final json = jsonDecode(response.body);
    final List<Region> regions = [];
    for (var item in json) {
      regions.add(Region.fromJson(item));
    }
    return regions;
  }
}
