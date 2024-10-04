class User {
  final int id;
  final int regionId;
  final int cityId;
  final int accountTypeId;
  final String name;

  const User({
    required this.id,
    required this.regionId,
    required this.cityId,
    required this.accountTypeId,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      regionId: json["region_id"],
      cityId: json["city_id"],
      accountTypeId: json["account_type_id"],
      name: json["name"],
    );
  }
}
