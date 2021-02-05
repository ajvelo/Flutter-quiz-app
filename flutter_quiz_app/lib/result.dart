import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key key, @required this.finalScore, @required this.reset})
      : super(key: key);

  final int finalScore;
  final Function reset;

  String get resultPhrase {
    return "Your final score is " + finalScore.toString() + "!";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
            onPressed: reset,
            textColor: Colors.blue,
            child: Text(
              "Restart",
              style: TextStyle(fontSize: 18.0),
            ))
      ]),
    );
  }
}
