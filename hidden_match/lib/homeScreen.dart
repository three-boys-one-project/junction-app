import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:hidden_match/globals.dart' as globals;

class HomeScreen extends StatelessWidget {
  static Route<dynamic> route(String mensaje) {
    return MaterialPageRoute(
      builder: (context) => HomeScreen(mensaje: mensaje),
    );
  }

  final String mensaje;

  const HomeScreen({Key key, @required this.mensaje}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Passar Mierdas"),
          ),
          body: Center(
            child: _buildButtons(),

          ),
      )

    );
  }
}

Widget _buildButtons() {
  return new Container(
    child: new Column(
      children: <Widget>[
        new RaisedButton(
          child: new Text('Hotal!'),
          onPressed: _buttonPressed,
        ),
      ],
    ),
  );
}

void _buttonPressed () async {
  var mac = '0:0:0:0:0:0';
  var hotal;
  globals.isPressed ? globals.isPressed = false : globals.isPressed = true;
  Duration time = new Duration(seconds: 5);
  while (globals.isPressed) {
    hotal = await fetchPost(mac);
    print(hotal);
    sleep(time);
  }
}

Future fetchPost(mac) {
  String countryUrl = 'http://hidden-match.herokuapp.com/$mac/';
  var hotal = http
      .get(countryUrl)
      .then((response) => jsonDecode(response.body)['response'])
      .catchError((error) => throw(error));

  return hotal;
}

