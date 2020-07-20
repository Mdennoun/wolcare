import 'package:flutter/material.dart';


class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SignupPageState();
}

// Used for controlling whether the user is loggin or creating an account
enum FormType {
  login,
  register
}

class _SignupPageState extends State<SignupPage> {

  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  final TextEditingController _pseudoFilter = new TextEditingController();
  final TextEditingController _lastNameFilter = new TextEditingController();
  final TextEditingController _firstNameFilter = new TextEditingController();
  String _email = "";
  String _password = "";
  String _pseudo = "";
  String _lastName = "";
  String _firstName = "";
  FormType _form = FormType
      .login; // our default setting is to login, and we should switch to creating an account when the user chooses to

  _SignupPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
    _pseudoFilter.addListener(_passwordListen);
    _lastNameFilter.addListener(_passwordListen);
    _firstNameFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  void _firstNameListen() {
    if (_firstNameFilter.text.isEmpty) {
      _firstName = "";
    } else {
      _firstName = _firstNameFilter.text;
    }
  }

  void _lastNameListen() {
    if (_lastNameFilter.text.isEmpty) {
      _lastName = "";
    } else {
      _lastName = _lastName;
    }
  }

  void _pseudoListen() {
    if (_pseudoFilter.text.isEmpty) {
      _pseudo = "";
    } else {
      _pseudo = _pseudoFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}