import 'package:flutter/material.dart';
import 'package:wolcaire/controller/detail_user.dart';
import 'package:wolcaire/model/connected_user.dart' as globals;
import 'package:wolcaire/model/request.dart';
import 'package:wolcaire/controller/request_item.dart';
import 'package:wolcaire/model/user.dart';
import 'package:wolcaire/controller/user_item.dart';
import 'package:wolcaire/model/workshop.dart';
import 'package:wolcaire/controller/workshop_item.dart';

import '../services/api_services.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;



  Widget test(int index) {
    switch (index) {
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
      case 3:
        print("test ou pas test" + globals.id);
        Future<User> user = ApiServices.getUser(globals.id);
        return FutureBuilder(
          future: user,
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
                  final User user = snapshot.data;
                  if (user == null) {
                    return Center(
                      child: Text("Vide"),
                    );
                  }

                  return DetailsUser(
                      id: user.id,
                      lastName: user.lastName,
                      firstName: user.firstName,
                      pseudo: user.pseudo,
                      photo: user.photo,
                      sex: user.sex.toString(),
                      requestIssued: user.requestIssued.toString(),
                      requestFulfilled: user.requestFulfilled.toString());
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
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profil'),
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
