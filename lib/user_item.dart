import 'package:flutter/material.dart';
import 'package:wolcaire/user.dart';

class UserItem extends StatelessWidget {
  final User user;

  const UserItem({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text("${user.firstName} ${user.lastName}"),
      subtitle: Text(user.type),
    );
  }
}