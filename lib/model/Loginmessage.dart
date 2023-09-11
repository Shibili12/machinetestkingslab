// To parse this JSON data, do
//
//     final loginmessage = loginmessageFromJson(jsonString);

import 'dart:convert';

Loginmessage loginmessageFromJson(String str) =>
    Loginmessage.fromJson(json.decode(str));

String loginmessageToJson(Loginmessage data) => json.encode(data.toJson());

class Loginmessage {
  String message;

  Loginmessage({
    required this.message,
  });

  factory Loginmessage.fromJson(Map<String, dynamic> json) => Loginmessage(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
