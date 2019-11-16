import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

void _buttonPressed () {
  Future<http.Response> fetchPost() {
    return http.get('https://172.0.0.1:5000/mac=hotaaaaaal');
  }
}