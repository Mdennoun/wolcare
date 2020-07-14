import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wolcaire/user.dart';

class ApiServices {
  static Future<List<User>> getUsers() async {
    final response =
        await http.get("https://wolcare.herokuapp.com/api/getUsers");

    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    final List<User> users = [];
    users.addAll((jsonBody as List).map((user) => User.fromJson(user)).toList());

    return users;
  }
}
