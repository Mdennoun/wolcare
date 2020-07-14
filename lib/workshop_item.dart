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
      leading: Icon(Icons.build),
      title: Text("${workshop.title}"),
      subtitle: Text(workshop.dateAvailable),
    );
  }
}