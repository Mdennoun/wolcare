import 'package:flutter/material.dart';
import 'package:wolcaire/user.dart';

import 'detail_user.dart';

class UserItem extends StatelessWidget {
  final User user;

  const UserItem({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var p = "https://plaisirdepeindre.fr/28-thickbox_default/peinture-par-numero-singe-pop-art.jpg";
    if(user.photo.substring(0) != 'u') {
      p = user.photo;
    }
    return ListTile(
      leading: CircleAvatar(
          child: ClipOval(
              child: Image.network(p)

          ),
      ),
      title: Text("${user.firstName} ${user.lastName}"),
      subtitle: Text(user.type),
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailsUser(
                id: user.id,
                lastName: user.lastName,
                firstName: user.firstName,
                pseudo: user.pseudo,
                photo: p,
                sex: user.sex.toString(),
                requestFulfilled: user.requestFulfilled.toString())),
          );

        }
    );
  }
}