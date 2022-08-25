// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class User {
    User({
        required this.createdAt,
        required this.name,
        required this.avatar,
        required this.updateAt,
        required this.id,
    });

    final DateTime createdAt;
    final String name;
    final String avatar;
    final DateTime updateAt;
    final String id;

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
        updateAt: DateTime.parse(json["updateAt"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "name": name,
        "avatar": avatar,
        "updateAt": updateAt.toIso8601String(),
        "id": id,
    };
}
