import 'package:flutter/material.dart';
import 'package:wolcaire/ModifyRequest.dart';
import 'package:wolcaire/update_user.dart';

class DetailsUser extends StatelessWidget {
  static const String routeName = "DetailsRequest";


  final String photo;
  final String id;
  final String lastName;
  final String firstName;
  final String pseudo;
  final String sex;
  final String requestIssued;
  final String requestFulfilled;


  const DetailsUser({
    this.id,
    this.lastName,
    this.firstName,
    this.pseudo,
    this.photo,
    this.sex,
    this.requestIssued,
    this.requestFulfilled
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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


              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[


                Text("Prénom : ${ firstName ?? 'undefined'}",textAlign: TextAlign.left,
                  style: new TextStyle(fontSize: 20, color: Colors.black),),
                Text("Nom : ${lastName ?? 'undefined'}",textAlign: TextAlign.left,
                    style: new TextStyle(fontSize: 20, color: Colors.black)),
                Text("Pseudo : ${pseudo ?? 'undefined'}",textAlign: TextAlign.left,
                  style: new TextStyle(fontSize: 20, color: Colors.black),),
                Text("Description : ${ pseudo ?? 'undefined'}",textAlign: TextAlign.left,
                  style: new TextStyle(fontSize: 20, color: Colors.black),),
                RaisedButton(
                  child: Text("Modifer"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UpdateUser(
                        id: id,
                        lastName: lastName,
                        firstName: firstName,
                        pseudo: pseudo,
                        sex: sex,
                        requestIssued: requestIssued,
                        requestFulfilled: requestFulfilled,
                      )),
                    );

                  },
                ),
              ],


              )




            ),


            ],

      ),
    );
  }




}
