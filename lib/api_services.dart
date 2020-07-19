import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:wolcaire/login_response.dart';
import 'package:wolcaire/request.dart';
import 'package:wolcaire/user.dart';
import 'package:wolcaire/workshop.dart';

class ApiServices {

  Future<Login> login(String email, String password) async {
   print("test");
   final response =
       await http.post(
     'https://wolcare.herokuapp.com/api/auth/login/',
     headers: <String, String>{
       'Content-Type': 'application/json; charset=UTF-8',
     },
     body: jsonEncode(<String, String>{
       'email': email,
       'password': password
     }),
   );
   print(response.statusCode);

   if (response.statusCode != 200) {
     throw Error();
   }
   final jsonBody = json.decode(response.body);
   print(jsonBody);
   final Login login =  Login.fromJson(jsonBody);
   return login;

  }

  Future<User> signUp(User user) async {
    print("test");
    final response =
    await http.post(
      'https://wolcare.herokuapp.com/api/auth/login/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': user.email,
        'password': user.password,
        'lastName': user.lastName,
        'firstName': user.firstName,
        'pseudo': user.pseudo,
        'photo': user.photo,
        'sex': user.sex.toString(),
        'type': user.type,
        'requestIssued': user.requestIssued.toString(),
        'requestFulfilled': user.requestFulfilled.toString(),
      }),
    );
    print(response.statusCode);

    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    print(jsonBody);
    final User my_user =  User.fromJson(jsonBody);
    return my_user;

  }



  Future<void> modificationOfRequest(String title, String description, String id) async {
    final response =
    await http.put(
      'https://wolcare.herokuapp.com/api/updateRequest/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': title,
        'description': description
      }),
    );

    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    print(jsonBody);

  }

  Future<void> updateUser(String firstname, String lastname, String id) async {
    final response =
    await http.put(
      'https://wolcare.herokuapp.com/api/updateUser/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'firstname': firstname,
        'lastname': lastname
      }),
    );
    print("https://wolcare.herokuapp.com/api/updateUser/$id");
    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    print(jsonBody);

  }



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
