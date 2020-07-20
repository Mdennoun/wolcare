import 'package:flutter/material.dart';
import 'package:wolcaire/user.dart';
import 'package:wolcaire/workshop.dart';

class WorkshopItem extends StatelessWidget {
  final Workshop workshop;

  const WorkshopItem({
    Key key,
    this.workshop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
            child: Image.network("https://www.territoiredebelfort.fr/sites/default/files/styles/large/public/environnement-maison-departementale-environnement-jardin-douce-territoire-belfort.jpg?itok=-zsGVk-t")

        ),

      title: Text("${workshop.title}"),
      subtitle: Text(workshop.dateAvailable),
    );
  }
}