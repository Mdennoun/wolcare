import 'package:flutter/material.dart';
import 'package:wolcaire/model/workshop.dart';
import 'package:wolcaire/controller/detail_workshop.dart';

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
            child: Image.network(
                "https://www.territoiredebelfort.fr/sites/default/files/styles/large/public/environnement-maison-departementale-environnement-jardin-douce-territoire-belfort.jpg?itok=-zsGVk-t")),
        title: Text("${workshop.title}"),
        subtitle: Text(workshop.dateAvailable),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsWorkShop(
                      id: workshop.id,
                      title: workshop.title,
                      photoPath:
                          "https://www.territoiredebelfort.fr/sites/default/files/styles/large/public/environnement-maison-departementale-environnement-jardin-douce-territoire-belfort.jpg?itok=-zsGVk-t",
                      description: workshop.description,
                      createAt: workshop.createAt,
                    )),
          );
        });
  }
}
