import 'package:flutter/material.dart';
import 'package:wolcaire/user.dart';
import 'package:wolcaire/user_item.dart';

import 'api_services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.amber,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: ApiServices.getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );
                }
                if (snapshot.hasData) {
                  final List<User> users = snapshot.data;
                  if (users.isEmpty) {
                    return Center(
                      child: Text("Empty list"),
                    );
                  }
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return UserItem(
                        user: users[index],
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text("No data"),
                  );
                }
                break;
              default:
                return Container();
                break;
            }
          },
        ),
      ),
    );
  }
}