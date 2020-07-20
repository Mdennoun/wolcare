import 'package:flutter/material.dart';
import 'package:wolcaire/request.dart';
import 'package:wolcaire/request_item.dart';

import 'package:http/http.dart' as http;

import 'api_services.dart';


class MyRequestList extends StatefulWidget {
  MyRequestList({Key key}) : super(key: key);

  @override
  _MyRequestStatefulWidgetState createState() =>
      _MyRequestStatefulWidgetState();
}

class _MyRequestStatefulWidgetState extends State<MyRequestList> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  Widget test(int index) {
    Future<List<Request>> requests = ApiServices.getRequestsByUser("5e48048059ac860004ce7dfe");
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
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
        //onTap: _onItemTapped,
      ),
    );
  }
  

}


