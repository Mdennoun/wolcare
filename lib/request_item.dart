import 'package:flutter/material.dart';
import 'package:wolcaire/request.dart';


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
      leading:  ClipRRect(
          child: Image.network("https://www.territoiredebelfort.fr/sites/default/files/styles/large/public/environnement-maison-departementale-environnement-jardin-douce-territoire-belfort.jpg?itok=-zsGVk-t")

      ),
      title: Text("${request.title} ${request.pseudoUser}"),
      subtitle: Text(request.createAt),
      onTap: (){
          Navigator.push(
            context,
              MaterialPageRoute(builder: (context) => DetailsRequest(
                  id: request.id,
                  title: request.title,
                  description: request.description,
                  photoPath: "https://www.territoiredebelfort.fr/sites/default/files/styles/large/public/environnement-maison-departementale-environnement-jardin-douce-territoire-belfort.jpg?itok=-zsGVk-t",
                  createAt: request.createAt,
                  pseudoUser: request.pseudoUser )),
          );
      }
      );

  }
}