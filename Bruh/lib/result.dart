import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase{
    var resultText="You did it!";
    if(resultScore<=8){
      resultText="You are awesome and innocent";
    }else if(resultScore<=8){
      resultText="Pretty Likeable";
    }
    else  if(resultScore<=16){
      resultText="You are Strange";
    }
    else
    {
      resultText="You are so bad!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
                child: Column(
                  children: [
                    Text(resultPhrase,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    ElevatedButton(child: Text('Restart Quiz!'), onPressed: resetHandler,
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(206, 108, 78, 168))),)
                  ],
                ),
              );
  }
}