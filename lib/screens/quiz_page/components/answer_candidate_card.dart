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
    return SizedBox(
      height: 75,
      child: Card(
        margin: const EdgeInsets.symmetric(
          vertical: 7,
          horizontal: 40,
        ),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(
            color: Color.fromARGB(255, 205, 205, 205),
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/quiz_page');
          },
          child: ListTile(
            title: Text(
              word[index],
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 6),
              child: Text(
                (index + 1).toString(),
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 169, 169, 169),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
