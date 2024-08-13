class City {
  final int id;
  final int regionId;
  final String name;

  const City({
    required this.id,
    required this.regionId,
    required this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json["id"],
      regionId: json["region_id"],
      name: json["name"],
    );
  }
}
