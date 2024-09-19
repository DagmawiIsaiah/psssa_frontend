import 'package:flutter/material.dart';

import '../models/models.dart';

class EssentialProvider extends ChangeNotifier {
  List<Category> categories = [];
  List<City> cities = [];
  List<Region> regions = [];

  void addCategories(List<Category> fetchedCategories) {
    fetchedCategories.map((category) => categories.add(category));
    notifyListeners();
  }

  String getCategoryNameById(int id) {
    for (var category in categories) {
      if (category.id == id) {
        return category.name;
      }
    }
    return "Category";
  }

  void addCities(List<City> fetchedCities) {
    fetchedCities.map((city) => cities.add(city));
    notifyListeners();
  }

  String getCityNameById(int id) {
    for (var city in cities) {
      if (city.id == id) {
        return city.name;
      }
    }
    return "City";
  }

  void addRegions(List<Region> fetchedRegions) {
    fetchedRegions.map((region) => regions.add(region));
    notifyListeners();
  }

  String getRegionNameById(int id) {
    for (var region in regions) {
      if (region.id == id) {
        return region.name;
      }
    }
    return "Region";
  }

  String getStatusById(int id) {
    if (id == 1) {
      return "Sent";
    }
    return "Recived";
  }
}
