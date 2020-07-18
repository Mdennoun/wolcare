import 'package:flutter/material.dart';
import 'package:wolcaire/ModifyRequest.dart';

class DetailsRequest extends StatelessWidget {
  static const String routeName = "DetailsRequest";

  final String id;
  final String title;
  final String createAt;
  final String pseudoUser;
  final String idCreator;
  final String description;
  final String idVolunteer;


  const DetailsRequest({
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


            Text("Title : ${title ?? 'undefined'}",
              style: new TextStyle(fontSize: 30, color: Colors.orange),),
            Text("Date de création : ${createAt ?? 'undefined'}",
                style: new TextStyle(fontSize: 18, color: Colors.black)),
            Text("pseudo de l'utilisateur : ${pseudoUser ?? 'undefined'}",
              style: new TextStyle(fontSize: 20, color: Colors.green),),
            Text("Description : ${description ?? 'undefined'}",
              style: new TextStyle(fontSize: 21, color: Colors.lightBlue),),
            RaisedButton(
              child: Text("Modifer"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ModifyRequest(id: id, title: title, description: description, createAt: createAt, pseudoUser: pseudoUser, )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Détail de la requête"),
      centerTitle: true,
    );
  }
}