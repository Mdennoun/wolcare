import 'package:flutter/material.dart';

import 'api_services.dart';

class ModifyWorkShop extends StatelessWidget {
  static const String routeName = "ModifyRequest";

  final String id;
  final String title;
  final String createAt;
  final String photoPath;
  final String pseudoUser;
  final String idCreator;
  final String description;
  final String idVolunteer;
  final DateTime dateAvailable;


  const ModifyWorkShop({
    this.dateAvailable,
    this.title,
    this.id,
    this.photoPath,
    this.idVolunteer,
    this.idCreator,
    this.createAt,
    this.pseudoUser,
    this.description
  });


  @override
  Widget build(BuildContext context) {
    final titlEdt = new TextEditingController(text: title);
    final descriptionEdt = new TextEditingController(text: description);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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


            Text("Date de création : ${createAt ?? 'undefined'}", textAlign: TextAlign.left,
                style: new TextStyle(fontSize: 17, color: Colors.black)),
            Text("pseudo de l'utilisateur : ", textAlign: TextAlign.left,
              style: new TextStyle(fontSize: 17, color: Colors.green),),
            TextField(
                controller: TextEditingController(text: pseudoUser)
            ),
            Text("Description : ", textAlign: TextAlign.left,
              style: new TextStyle(fontSize: 17, color: Colors.lightBlue),),
            TextField(
                controller: TextEditingController(text: description)
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: RaisedButton(
                onPressed: () => _selectDate(context) as DateTime,
                child: Text('Selectionnez une date'),
                color: Colors.blue,
                textColor: Colors.white,
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0.0,10.0,0.0,0.0),
              child: RaisedButton(
                onPressed: () => _selectTime(context) as TimeOfDay,
                child: Text('Selectionnez une heure de début'),
                color: Colors.blue,
                textColor: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0,10.0,0.0,0.0),
              child: RaisedButton(
                onPressed: () => _selectTime(context) as TimeOfDay,
                child: Text('Selectionnez une heure de fin'),
                color: Colors.blue,
                textColor: Colors.white,

              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0.0,10.0,0.0,0.0),
              child: RaisedButton(
                child: Text("Enregistrer les modifications"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  ApiServices services = new ApiServices();
                  services.modificationOfWorkShop(titlEdt.text.toString(),descriptionEdt.text.toString(), id, DateTime, DateTime);//TODO remplacer pâr les vrai valur
                  Navigator.of(context).pop();

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
      title: new Text("Modification de l'atelier"),
      centerTitle: true,
    );
  }


  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      //setState(() {
        selectedDate = picked;
      //});
    return selectedDate;
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay selectedTime = TimeOfDay.now();
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: selectedTime);

    if (picked != null && picked != selectedTime)
      //setState(() {
      selectedTime = picked;
    //});
    return selectedTime;
  }






}