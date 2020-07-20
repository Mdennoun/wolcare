import 'package:flutter/material.dart';
import 'package:wolcaire/workshop.dart';
import 'package:wolcaire/DetailsWorkShop.dart';

class WorkshopItem extends StatelessWidget {
  final Workshop workshop;

  const WorkshopItem({
    Key key,
    this.workshop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.build),
      title: Text("${workshop.title}"),
      subtitle: Text(workshop.dateAvailable),
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailsWorkShop(
                id: workshop.id,
                title: workshop.title,
                description: workshop.description,
                createAt: workshop.createAt,
                )),
          );
        }
    );
  }
}