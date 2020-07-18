import 'package:flutter/material.dart';
import 'package:wolcaire/DetailsRequest.dart';

import 'api_services.dart';

class ModifyRequest extends StatelessWidget {
  static const String routeName = "ModifyRequest";

  final String id;
  final String title;
  final String createAt;
  final String pseudoUser;
  final String idCreator;
  final String description;
  final String idVolunteer;


  const ModifyRequest({
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

          children: <Widget>[

            Text("Title : ",
              style: new TextStyle(fontSize: 30, color: Colors.orange),),
            TextField(
              controller: TextEditingController(text: title)
            ),
            Text("Date de création : ${createAt ?? 'undefined'}",
                style: new TextStyle(fontSize: 18, color: Colors.black)),
            Text("pseudo de l'utilisateur : ",
            style: new TextStyle(fontSize: 20, color: Colors.green),),
            TextField(
                controller: TextEditingController(text: pseudoUser)
            ),
            Text("Description : ",
            style: new TextStyle(fontSize: 21, color: Colors.lightBlue),),
            TextField(
                controller: TextEditingController(text: description)
            ),
            RaisedButton(
              child: Text("Enregistrer les modifications"),
              onPressed: () {
                _updateModification();
                Navigator.of(context).pop();


              },
            ),
          ],

        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Modification de la requête"),
      centerTitle: true,
    );
  }

  void _updateModification () {
    ApiServices services = new ApiServices();
     services.modificationOfRequest(title,description, id);

  }
}