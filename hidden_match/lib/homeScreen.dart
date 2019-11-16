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
            floatingActionButton: FloatingActionButton(
              child: Text("Hotal"),
              onPressed: Future<http.Response> fetchPost() {
                            return http.get('https://jsonplaceholder.typicode.com/posts/1');
                          },
            ),
          ),
      )

    );
  }

  Future<http.Response> fetchPost() {
    return http.get('https://jsonplaceholder.typicode.com/posts/1');
  }
}