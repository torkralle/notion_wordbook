// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class AnswerCandidateCard extends StatelessWidget {
  const AnswerCandidateCard({
    Key? key,
    required this.index,
    required this.word,
    // required this.isCorrect,
  }) : super(key: key);

  final int index;
  final List<String> word;
  // final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 40,
      ),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/quiz_page');
        },
        child: ListTile(
          title: Text(word[index]),
        ),
      ),
    );
  }
}
