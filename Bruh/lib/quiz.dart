import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int quesIndex;
  final Function answerFunction;
  Quiz(
      {@required this.questions,
      @required this.answerFunction,
      @required this.quesIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          Question(
            questions[quesIndex]['questionText'] as String,
          ),
          ...(questions[quesIndex]['answer'] as List<Map<String, Object>>).map((ans){
            return Answer(() => answerFunction(ans['score']), ans['option'] as String);
          }).toList()
        ],
      ),
    );
  }
}
