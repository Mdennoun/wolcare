import 'package:flutter/material.dart';
import 'package:wolcaire/ModifyRequest.dart';
import 'package:wolcaire/login.dart';
import 'package:wolcaire/request.dart';
import 'package:wolcaire/request_item.dart';
import 'package:wolcaire/user.dart';
import 'package:wolcaire/user_item.dart';
import 'package:flutter/material.dart';
import 'package:wolcaire/workshop.dart';
import 'package:wolcaire/workshop_item.dart';
import 'package:http/http.dart' as http;

import 'api_services.dart';
import 'login_response.dart';



class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  Widget test(int index) {
    switch(index) {
      case 0:
        Future<List<User>> users = ApiServices.getUsers();
        return FutureBuilder(
          future: users,
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
        );
        break;
      case 1:
        Future<List<Workshop>> workshops = ApiServices.getWorkshops();
        return FutureBuilder(
          future: workshops,
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
                  final List<Workshop> workshops = snapshot.data;
                  if (workshops.isEmpty) {
                    return Center(
                      child: Text("Empty list"),
                    );
                  }
                  return ListView.builder(
                    itemCount: workshops.length,
                    itemBuilder: (BuildContext context, int index) {
                      return WorkshopItem(
                        workshop: workshops[index],
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
        );
        break;
      case 2:
        Future<List<Request>> requests = ApiServices.getRequests();
        return FutureBuilder(
          future: requests,
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
                  final List<Request> requests = snapshot.data;
                  if (requests.isEmpty) {
                    return Center(
                      child: Text("Empty list"),
                    );
                  }
                  return ListView.builder(
                    itemCount: requests.length,

                    itemBuilder: (BuildContext context, int index) {


                      return RequestItem(

                        request: requests[index],
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
        );
        break;

    }


    return FutureBuilder(
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
    );
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

    });
  }

  void _onRequestTapped(int index) {
    setState(() {
      _selectedIndex = index;


    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wolcare'),
      ),
      body: Center(
        child: test(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Utilisateurs'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Ateliers'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            title: Text('Requetes'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}