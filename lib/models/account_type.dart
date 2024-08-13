class AccountType {
  final int id;
  final String name;

  const AccountType({
    required this.id,
    required this.name,
  });

  factory AccountType.fromJson(Map<String, dynamic> json) {
    return AccountType(
      id: json["id"],
      name: json["name"],
    );
  }
}
