class Record {
  final int id;
  final int regionId;
  final int categoryId;
  final int cityId;
  final int createdCityID;
  final int statusId;
  final String name;
  final String pentionNumber;

  const Record( {
    required this.id,
    required this.regionId,
    required this.cityId,
    required this.categoryId,
    required this.createdCityID,
    required this.statusId,
    required this.name,
    required this.pentionNumber,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      id: json["id"],
      regionId: json["region_id"],
      cityId: json["city_id"],
      categoryId: json["category_id"],
      createdCityID: json["created_city_id"],
      statusId: json["status_id"],
      name: json["name"],
      pentionNumber: json["pension_number"],
    );
  }
}
