import 'package:flutter/material.dart';
import 'package:wolcaire/request.dart';
import 'package:wolcaire/request_by_user_list.dart';


import 'DetailsRequest.dart';

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
      title: Text("${request.title} ${request.pseudoUser}"),
      subtitle: Text(request.createAt),
      onTap: (){
          Navigator.push(
            context,
              MaterialPageRoute(builder: (context) => MyRequestList(
                  /*id: request.id,
                  title: request.title,
                  description: request.description,
                  createAt: request.createAt,
                  pseudoUser: request.pseudoUser*/ )),
          );
      }
      );

  }
}