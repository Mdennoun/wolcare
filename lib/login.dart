import 'package:flutter/material.dart';
import 'package:wolcaire/user.dart';

import 'api_services.dart';
import 'home.dart';
import 'login_response.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

// Used for controlling whether the user is loggin or creating an account
enum FormType {
  login,
  register
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();

  final TextEditingController _pseudoFilter = new TextEditingController();
  final TextEditingController _lastNameFilter = new TextEditingController();
  final TextEditingController _firstNameFilter = new TextEditingController();
  final TextEditingController _typeFilter = new TextEditingController();
  final TextEditingController _photoFilter = new TextEditingController();
  final TextEditingController _sexFilter = new TextEditingController();
  final TextEditingController _requestIssuedFilter = new TextEditingController();
  final TextEditingController _requestFulfilledFilter = new TextEditingController();
  String _email = "";
  String _password = "";

  String _pseudo = "";
  String _lastName = "";
  String _firstName = "";
  String _type="";
  String _photo="";
  bool _sex =false;
  int _requestIssued =0;
  int _requestFulfilled =0;

  FormType _form = FormType.login; // our default setting is to login, and we should switch to creating an account when the user chooses to

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);

    _pseudoFilter.addListener(_pseudoListen);
    _lastNameFilter.addListener(_lastNameListen);
    _firstNameFilter.addListener(_firstNameListen);
    _typeFilter.addListener(_typeListen);
    _photoFilter.addListener(_photoListen);
    _sexFilter.addListener(_sexListen);
    _requestIssuedFilter.addListener(_requestIssuedListen);
    _requestFulfilledFilter.addListener(_requestFulfilledListen);

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
      _lastName = _lastNameFilter.text;
    }
  }

  void _pseudoListen() {
    if (_pseudoFilter.text.isEmpty) {
      _pseudo = "";
    } else {
      _pseudo = _pseudoFilter.text;
    }
  }

  void _typeListen() {
    if (_typeFilter.text.isEmpty) {
      _type = "";
    } else {
      _type = _typeFilter.text;
    }
  }

  void _sexListen() {
    if (_sexFilter.text.isEmpty) {
      _sex = true;
    } else {
      _sex = _sexFilter as bool;
    }
  }

  void _photoListen() {
    if (_photoFilter.text.isEmpty) {
      _photo = "";
    } else {
      _photo = _photoFilter.text;
    }
  }

  void _requestIssuedListen() {
    if (_requestIssuedFilter.text.isEmpty) {
      _requestIssued = 0;
    } else {
      _requestIssued = _requestIssuedFilter as int;
    }
  }

  void _requestFulfilledListen() {
    if (_requestFulfilledFilter.text.isEmpty) {
      _requestFulfilled = 0;
    } else {
      _requestFulfilled = _requestFulfilledFilter as int;
    }
  }


  // Swap in between our two forms, registering and logging in
  void _formChange () async {
    setState(() {
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Wolcare"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    if(_form == FormType.login){
        return new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                child : new TextField(
                  controller: _emailFilter,
                  decoration: new InputDecoration(
                    labelText: 'Email'
                  ),
                )
              ),
              new Container(
                child :new TextField(
                  controller: _passwordFilter,
                  decoration: new InputDecoration(
                    labelText: 'Mot de passe'
                  ),
                ),
              ),
            ],
          ),
        );
    } else {
      return new Container(
        child: new Column(
          children: <Widget>[
            new Container(
              child: new TextField(
                controller: _emailFilter,
                decoration: new InputDecoration(
                    labelText: 'Email'
                ),
              ),
            ),
            new Container(
              child: new TextField(
                controller: _passwordFilter,
                decoration: new InputDecoration(
                    labelText: 'Password'
                ),
                obscureText: true,
              ),
            ),
            new Container(
              child: new TextField(
                controller: _pseudoFilter,
                decoration: new InputDecoration(
                    labelText: 'Pseudo'
                ),
                obscureText: true,
              ),
            ),
            new Container(
              child: new TextField(
                controller: _firstNameFilter,
                decoration: new InputDecoration(
                    labelText: 'prenom'
                ),
                obscureText: true,
              ),
            ),
            new Container(
              child: new TextField(
                controller: _lastNameFilter,
                decoration: new InputDecoration(
                    labelText: 'nom'
                ),
                obscureText: true,
              ),
            ),
            new Container(
              child: new TextField(
                controller: _photoFilter,
                decoration: new InputDecoration(
                    labelText: 'mettez une photo'
                ),
                obscureText: true,
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildButtons() {
    if (_form == FormType.login) {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Login'),
              onPressed: _loginPressed,
            ),
            new FlatButton(
              child: new Text('Vous n\'avez pas de compte ? Inscrivez vous.'),
              onPressed: _formChange,
            ),
            new FlatButton(
              child: new Text('Mot de passe oublié ?'),
              onPressed: _passwordReset,
            )
          ],
        ),
      );
    } else {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('S\'inscrire'),
              onPressed: _createAccountPressed,
            ),
            new FlatButton(
              child: new Text('Vous avez deja un compte? Connectez-vous!.'),
              onPressed: _formChange,
            )
          ],
        ),
      );
    }
  }

  // These functions can self contain any user auth logic required, they all have access to _email and _password

  void _loginPressed () {
    print('L\'utilisateur souhaite se connecter avec $_email et $_password');
    ApiServices services = new ApiServices();
    Login login;
    services.login(_email,_password).then((result) {
    print(result);
    setState(() {
       login = result;

        print(login.auth);
       if(login.auth){
         Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => MyStatefulWidget()),
         );
       } else {
         print("Error on login");
       }
    });
    });
  }

  void _createAccountPressed () {
    print('L\'utilisateur souhaite s\'inscrir');
    ApiServices services = new ApiServices();
    User user = new User(null, _lastName, _firstName,_email,_password, "flutter", _pseudo, _photo, _sex, _requestIssued, _requestFulfilled);
    services.signUp(user).then((result) {
      print(result);
      setState(() {
        user = result;

//        print(login.auth);
//        if(login.auth){
//          Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => MyStatefulWidget()),
//          );
//        } else {
//          print("Error on login");
//        }
      });
    });
  }





  void _passwordReset () {
    print("L\'utilisateur veut qu'on envoi le mail de renisialisation a  $_email");
  }


}
