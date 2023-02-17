import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    required this.id,
    required this.name,
    required this.charge,
    required this.product,
  });

  String id;
  String name;
  String charge;
  String product;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["id"],
    name: json["name"],
    charge: json["charge"],
    product: json["product"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "charge": charge,
    "product": product,
  };
}
