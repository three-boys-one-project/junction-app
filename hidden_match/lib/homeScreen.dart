import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:hidden_match/globals.dart' as globals;
import 'package:hidden_match/local_notications_helper.dart';
import 'package:hidden_match/second_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomeScreen extends StatelessWidget {
  static Route<dynamic> route(String mensaje) {
    return MaterialPageRoute(
      builder: (context) => HomeScreen(mensaje: mensaje),
    );
  }

  final String mensaje;

  const HomeScreen({Key key, @required this.mensaje}) : super(key: key);


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tap To Start Matching!',
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              RaisedButton(
                child: Text("Rock & Roll"),
                onPressed:() => _buttonPressed(context),
                color: Colors.white,
                textColor: Colors.orange,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _buttonPressed (context) async {

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    await Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => SecondPage(payload: payload)),
    );
  }

  final notifications = FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid = new AndroidInitializationSettings(
      'app_icon');
  var initializationSettingsIOS = new IOSInitializationSettings();
  var initializationSettings = new InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  notifications.initialize(
      initializationSettings, onSelectNotification: onSelectNotification);

  var mac = '0:0:0:0:0:0';
  var hotal;
  globals.isPressed ? globals.isPressed = false : globals.isPressed = true;
  Duration time = new Duration(seconds: 1);
  while (globals.isPressed) {
    hotal = await fetchPost(mac);
    print(hotal);
    if (hotal != 'Nothing to see here') {
      showOngoingNotification(notifications, title: 'Hidden Match!', body: hotal);
      globals.message=hotal;
    }
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




