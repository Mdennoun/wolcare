import 'package:flutter/material.dart';
import 'package:wolcaire/request.dart';
import 'package:wolcaire/user.dart';
import 'package:wolcaire/workshop.dart';

class RequestItem extends StatelessWidget {
  final Request request;

  const RequestItem({
    Key key,
    this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.build),
      title: Text("${request.title} ${request.psuedoUser}"),
      subtitle: Text(request.createAt),
    );
  }
}