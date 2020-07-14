import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wolcaire/request.dart';
import 'package:wolcaire/user.dart';
import 'package:wolcaire/workshop.dart';

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

  static Future<List<Workshop>> getWorkshops() async {
    final response =
    await http.get("https://wolcare.herokuapp.com/api/getWorkShops");

    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    final List<Workshop> workshops = [];
    workshops.addAll((jsonBody as List).map((workshop) => Workshop.fromJson(workshop)).toList());

    return workshops;
  }

  static Future<List<Request>> getRequests() async {
    final response =
    await http.get("https://wolcare.herokuapp.com/api/getRequests");

    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    final List<Request> requests = [];
    requests.addAll((jsonBody as List).map((request) => Request.fromJson(request)).toList());

    return requests;
  }

}
