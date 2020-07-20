/*
*
*
*         Future<List<Workshop>> workshops = ApiServices.getWorkshops();
        return FutureBuilder(
          future: workshops,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );
                }
                if (snapshot.hasData) {
                  final List<Workshop> workshops = snapshot.data;
                  if (workshops.isEmpty) {
                    return Center(
                      child: Text("Empty list"),
                    );
                  }
                  return ListView.builder(
                    itemCount: workshops.length,
                    itemBuilder: (BuildContext context, int index) {
                      return WorkshopItem(
                        workshop: workshops[index],
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text("No data"),
                  );
                }
                break;
              default:
                return Container();
*
*
* */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkShopParticipation extends StatelessWidget {
  static const String routeName = "WorkShopParticipation";

  final String id;
  final String title;
  final String createAt;
  final String pseudoUser;
  final String idCreator;
  final String description;
  final String idVolunteer;
  final String dateAvailable;
  final String datEnd;

//TODO faire le listing des workShop participation, les dates dans modifWORKS ->
// enregistrer et seter les dates en parametre (modifier aussi api servies et enlever les fichier / dossierz

  const WorkShopParticipation(
      {this.dateAvailable,
      this.title,
      this.id,
      this.idVolunteer,
      this.idCreator,
      this.createAt,
      this.pseudoUser,
      this.description,
      this.datEnd});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Center(),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Détail de l'atelier"),
      centerTitle: true,
    );
  }

  String dateConverter() {
    final dateFormat = new DateFormat('yyyy-MM-dd');
    var date = dateFormat.parse(DateTime.now().toString());
    String createFormatted = dateFormat.format(date);
    return createFormatted;
  }
}
