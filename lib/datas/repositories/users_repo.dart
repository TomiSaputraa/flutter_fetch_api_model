import 'dart:convert';

import 'package:fetch_api/datas/model/users_model.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<List<User>> getData() async {
    var baseUrl = 'https://63070990c0d0f2b8012570e6.mockapi.io/api';
    var response = await http.get(Uri.parse(baseUrl));
    var jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      List<User> users = [];

      for (var u in jsonData) {
        User user = User(
            createdAt: DateTime.parse(u['createdAt']),
            name: u['name'],
            avatar: u['avatar'],
            updateAt: DateTime.parse(u['createdAt']),
            id: u['id']);

        users.add(user);
      }
      print(jsonData);
      return users;
    } else {
      throw Exception("Failed to load cat fact!");
    }
  }
}
