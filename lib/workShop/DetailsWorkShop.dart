import 'package:flutter/material.dart';
import 'package:wolcaire/request/ModifyRequest.dart';
import 'package:intl/intl.dart';
import 'package:wolcaire/workShop/MidifyWorkShop.dart';

class DetailsWorkShop extends StatelessWidget {
  static const String routeName = "DetailsWorkShop";

  final String id;
  final String title;
  final String createAt;
  final String pseudoUser;
  final String idCreator;
  final String description;
  final String idVolunteer;


  const DetailsWorkShop({
    this.title,
    this.id,
    this.idVolunteer,
    this.idCreator,
    this.createAt,
    this.pseudoUser,
    this.description
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Titre : ",
                style: new TextStyle(fontSize: 30, color: Colors.blueAccent),),
            ),
            Text( "${title ?? 'undefined'}",
              style: new TextStyle(fontSize: 30, color: Colors.blueAccent),),
            Padding(
              padding: const EdgeInsets.all(15.0),

              child: Text("Date de création :",
                  style: new TextStyle(fontSize: 18, color: Colors.black)),
            ),
            Text(" ${dateConverter() ?? 'undefined'}",
                style: new TextStyle(fontSize: 18, color: Colors.black)),
            Padding(
              padding: const EdgeInsets.all(15.0),

              child: Text("pseudo de l'utilisateur : ",
                style: new TextStyle(fontSize: 20, color: Colors.green),),
            ),
            Text("${pseudoUser ?? 'undefined'}",
              style: new TextStyle(fontSize: 20, color: Colors.green),),
            Padding(
              padding: const EdgeInsets.all(15.0),

              child: Text("Description : ",
                style: new TextStyle(fontSize: 21, color: Colors.lightBlue),),
            ),
            Text("${description ?? 'undefined'}",
              style: new TextStyle(fontSize: 21, color: Colors.lightBlue),),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: RaisedButton(
                child: Text("Modifer"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ModifyWorkShop(id: id, title: title, description: description, createAt: createAt, pseudoUser: pseudoUser, )),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Détail de l'atelier"),
      centerTitle: true,
    );
  }

  String dateConverter () {
    final dateFormat = new DateFormat('yyyy-MM-dd');
    var date = dateFormat.parse(DateTime.now().toString());
    String createFormatted = dateFormat.format(date);
    return createFormatted;
  }}