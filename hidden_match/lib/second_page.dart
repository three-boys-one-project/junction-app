import 'package:flutter/material.dart';
import 'package:hidden_match/globals.dart' as globals;

class SecondPage extends StatelessWidget {
  final String payload;

  const SecondPage({
    @required this.payload,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                globals.message,
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              RaisedButton(
                child: Text("Back"),
                onPressed: () => Navigator.pop(context),
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