import 'package:flutter/material.dart';
import 'api_services.dart';

class ModifyRequest extends StatelessWidget {
  static const String routeName = "ModifyRequest";

  final String id;
  final String title;
  final String createAt;
  final String pseudoUser;
  final String photoPath;
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
    this.photoPath,
    this.description
  });


  @override
  Widget build(BuildContext context) {
    final titlEdt = new TextEditingController(text: title);
    final descriptionEdt = new TextEditingController(text: description);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
        SliverAppBar(

        expandedHeight: 200,
        flexibleSpace: FlexibleSpaceBar(
          title: Text("$title"),
          background: Hero(
            tag: "pseudo",
            child: Image.network(photoPath,
              fit: BoxFit.cover,
            ),

          ),
        ),


      ),
      SliverAppBar(

        expandedHeight: 400,
        backgroundColor: Colors.white,
        flexibleSpace: Column(


          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[

            Text("Date de création : ${createAt ?? 'undefined'}",textAlign: TextAlign.left,
                style: new TextStyle(fontSize: 17, color: Colors.black)),
            Text("pseudo : ",textAlign: TextAlign.left,
            style: new TextStyle(fontSize: 17, color: Colors.green),),
            TextField(
                controller: TextEditingController(text: pseudoUser)
            ),
            Text("Description : ",textAlign: TextAlign.left,
            style: new TextStyle(fontSize: 17, color: Colors.lightBlue),),
            TextField(
                controller: TextEditingController(text: description)
            ),
            RaisedButton(
              child: Text("Enregistrer les modifications"),
              onPressed: () {
                ApiServices services = new ApiServices();
                services.modificationOfRequest(titlEdt.text.toString(),descriptionEdt.text.toString(), id);
                Navigator.of(context).pop();


              },
            ),
          ],

        ),
      ),
        ],

      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Modification de la requête"),
      centerTitle: true,
    );
  }


}