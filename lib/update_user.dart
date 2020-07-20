import 'package:flutter/material.dart';
import 'package:wolcaire/DetailsRequest.dart';

import 'api_services.dart';

class UpdateUser extends StatelessWidget {
  static const String routeName = "UpdateUser";

  final String id;
  final String lastName;
  final String firstName;
  final String photo;
  final String pseudo;
  final String sex;
  final String requestIssued;
  final String requestFulfilled;


  const UpdateUser({
    this.id,
    this.lastName,
    this.firstName,
    this.photo,
    this.pseudo,
    this.sex,
    this.requestIssued,
    this.requestFulfilled
  });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body:  CustomScrollView(
      slivers: <Widget>[
      SliverAppBar(

      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
      title: Text("$firstName $lastName"),
      background: Hero(
      tag: "pseudo",
      child: Image.network(photo,
      fit: BoxFit.cover,
      ),

      ),

      ),


      ),
      SliverAppBar(

        expandedHeight: 300,
        backgroundColor: Colors.white,
        flexibleSpace: Column(

          children: <Widget>[

            Text("Prenom: ",
              style: new TextStyle(fontSize: 17, color: Colors.black),),
            TextField(
                controller: TextEditingController(text: firstName)
            ),
            Text("Nom  : ",
              style: new TextStyle(fontSize: 17, color: Colors.black),),
            TextField(
                controller: TextEditingController(text: lastName)
            ),
            Text("Pseudo  : ",
              style: new TextStyle(fontSize: 17, color: Colors.black),),
            TextField(
                controller: TextEditingController(text: pseudo)
            ),

            RaisedButton(
              child: Text("Enregistrer les modifications"),
              onPressed: () {
                _updateModification();
                Navigator.of(context).pop();



              },
            ),
          ],


        )




    ),


        ],

      ),
    );
  }






Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Modification du profil"),
      centerTitle: true,
    );
  }

  void _updateModification () {
    ApiServices services = new ApiServices();
    services.updateUser(firstName,lastName, id);

  }
}