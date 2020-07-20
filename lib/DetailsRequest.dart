import 'package:flutter/material.dart';
import 'package:wolcaire/ModifyRequest.dart';
import 'package:intl/intl.dart';

class DetailsRequest extends StatelessWidget {
  static const String routeName = "DetailsRequest";

  final String id;
  final String title;
  final String createAt;
  final String pseudoUser;
  final String photoPath;
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
    this.photoPath,
    this.description
  });

  @override
  Widget build(BuildContext context) {
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

            Padding(
              padding: const EdgeInsets.all(15.0),

              child: Text("Date de création: ${dateConverter() ?? 'undefined'}",textAlign: TextAlign.left,
                  style: new TextStyle(fontSize: 17, color: Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),

              child: Text("pseudo : ${pseudoUser ?? 'undefined'}",textAlign: TextAlign.left,
                style: new TextStyle(fontSize: 17, color: Colors.black),),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),

              child: Text("Description : ",textAlign: TextAlign.left,
                style: new TextStyle(fontSize: 17, color: Colors.black),),
            ),
            Text("${description ?? 'undefined'}",textAlign: TextAlign.left,
              style: new TextStyle(fontSize: 17, color: Colors.black),),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: RaisedButton(
                child: Text("Modifer"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ModifyRequest(id: id, title: title, description: description, photoPath: photoPath, createAt: createAt, pseudoUser: pseudoUser, )),
                  );
                },
              ),
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
      title: new Text("Détail de la requête"),
      centerTitle: true,
    );
  }

  String dateConverter () {
    final dateFormat = new DateFormat('yyyy-MM-dd');
    var date = dateFormat.parse(createAt.toString());
    String createFormatted = dateFormat.format(date);
    return createFormatted;
  }}