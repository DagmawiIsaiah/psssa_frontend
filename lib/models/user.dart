class User {
  final int id;
  final int regionId;
  final int cityId;
  final int accountTypeId;
  final String name;
  final String password;

  const User({
    required this.id,
    required this.regionId,
    required this.cityId,
    required this.accountTypeId,
    required this.name,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      regionId: json["regionId"],
      cityId: json["cityId"],
      accountTypeId: json["accountTypeId"],
      name: json["name"],
      password: json["password"],
    );
  }
}
