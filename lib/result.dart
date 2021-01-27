import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;

    if (resultScore <= 8) {
      resultText = 'Vous n\'avez pas progressé';
    } else if (resultScore <= 12) {
      resultText = 'Vous êtes un peu au dessus de la moyenne';
    } else if (resultScore <= 16) {
      resultText = 'Tu es fort';
    } else {
      resultText = 'Il va falloir t\'ameliorer';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(child: Text('Recommencer !'), textColor: Colors.blue[600], onPressed: resetHandler,)
        ],
      ),
    );
  }
}
