import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback pressMe;
  final String ansString;
  Answer(this.pressMe,this.ansString);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5)
      ,
      child: 
      ElevatedButton(
              onPressed: pressMe,
              child: Text(ansString),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(206, 108, 78, 168))),
            ),
    );
  }
}

