import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wolcaire/ModifyWorkShop.dart';

class DetailsWorkShop extends StatelessWidget {
  static const String routeName = "DetailsWorkShop";

  final String id;
  final String title;
  final String createAt;
  final String pseudoUser;
  final String idCreator;
  final String description;
  final String photoPath;
  final String idVolunteer;
  final String dateAvailable;
  final String datEnd;



  const DetailsWorkShop({
    this.dateAvailable,
    this.title,
    this.id,
    this.idVolunteer,
    this.idCreator,
    this.createAt,
    this.pseudoUser,
    this.description,
    this.photoPath,
    this.datEnd
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

              child: Text("Date de création :  ${dateConverter() ?? 'undefined'}",textAlign: TextAlign.left,
                  style: new TextStyle(fontSize: 17, color: Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),

              child: Text("pseudo : ${pseudoUser ?? 'Utilisateur inconnu'}",textAlign: TextAlign.left,
                style: new TextStyle(fontSize: 17, color: Colors.black),),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Heure début : ${dateAvailable ?? 'Heure de début non renseignée'}",textAlign: TextAlign.left,
                style: new TextStyle(fontSize: 17, color: Colors.black),

              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Heure de fin: ${datEnd ?? 'Heure de fin non renseignée'}",textAlign: TextAlign.left,
                style: new TextStyle(fontSize: 20, color: Colors.black),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),

              child: Text("Description : ",textAlign: TextAlign.left,
                style: new TextStyle(fontSize: 21, color: Colors.black),),
            ),


            Text("${description ?? 'undefined'}",textAlign: TextAlign.left,
              style: new TextStyle(fontSize: 21, color: Colors.black),),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: RaisedButton(
                child: Text("Modifer"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ModifyWorkShop(id: id, title: title, description: description,photoPath: photoPath, createAt: createAt, pseudoUser: pseudoUser, )),
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
      title: new Text("Détail de l'atelier"),
      centerTitle: true,
    );
  }

  String dateConverter () {
    final dateFormat = new DateFormat('yyyy-MM-dd');
    var date = dateFormat.parse(DateTime.now().toString());
    String createFormatted = dateFormat.format(date);
    return createFormatted;
  }


}