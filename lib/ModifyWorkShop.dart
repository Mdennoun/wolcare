import 'package:flutter/material.dart';

import 'api_services.dart';

class ModifyWorkShop extends StatelessWidget {
  static const String routeName = "ModifyRequest";

  final String id;
  final String title;
  final String createAt;
  final String pseudoUser;
  final String idCreator;
  final String description;
  final String idVolunteer;
  final DateTime dateAvailable;


  const ModifyWorkShop({
    this.dateAvailable,
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
    final titlEdt = new TextEditingController(text: title);
    final descriptionEdt = new TextEditingController(text: description);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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