import 'package:flutter/material.dart';

class ModifyRequest extends StatelessWidget {
  static const String routeName = "ModifyRequest";

  final String identifier;

  const ModifyRequest({
    this.identifier,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("ModifyRequest"),
            Text("Identifier = ${identifier ?? 'undefined'}"),
            RaisedButton(
              child: Text("Go back"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}