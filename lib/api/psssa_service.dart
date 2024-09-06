import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';
import '../utils/utils.dart';

class PsssaService {
  Future<Response> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$devAPI/login"),
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
    final response = await http.get(Uri.parse("$devAPI/category"));
    final json = jsonDecode(response.body);
    final List<Category> categories = [];
    for (var item in json) {
      categories.add(Category.fromJson(item));
    }
    return categories;
  }

  Future<List<City>> getCities() async {
    final response = await http.get(Uri.parse("$devAPI/city"));
    final json = jsonDecode(response.body);
    final List<City> cities = [];
    for (var item in json) {
      cities.add(City.fromJson(item));
    }
    return cities;
  }

  Future<List<Region>> getRegions() async {
    final response = await http.get(Uri.parse("$devAPI/region"));
    final json = jsonDecode(response.body);
    final List<Region> regions = [];
    for (var item in json) {
      regions.add(Region.fromJson(item));
    }
    return regions;
  }
}
