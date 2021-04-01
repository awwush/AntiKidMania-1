
//of no use right now

// To parse this JSON data, do
//
//     final registerParent = registerParentFromJson(jsonString);

import 'dart:convert';

RegisterParent registerParentFromJson(String str) => RegisterParent.fromJson(json.decode(str));

String registerParentToJson(RegisterParent data) => json.encode(data.toJson());

class RegisterParent {
  RegisterParent({
    this.name,
    this.email,
    this.password,
  });

  String name;
  String email;
  String password;

  factory RegisterParent.fromJson(Map<String, dynamic> json) => RegisterParent(
    name: json["name"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
  };
}
