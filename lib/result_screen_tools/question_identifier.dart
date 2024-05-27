import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  final int questionIndex;
  final bool isCorrectQuestion;

  const QuestionIdentifier({
    super.key,
    required this.questionIndex,
    required this.isCorrectQuestion,
  });
  @override
  Widget build(context) {
    final Color containerColor;
    if (isCorrectQuestion) {
      containerColor = Colors.green;
    } else {
      containerColor = Colors.red;
    }
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        (questionIndex + 1).toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
