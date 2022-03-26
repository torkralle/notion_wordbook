import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List wordList = ['a', 'b', 'c', 'd'];
    return Scaffold(
      body: Expanded(
        child: Column(
          children: [
            Row(
              children: const [
                Icon(
                  Icons.close,
                ),
                LinearProgressIndicator(
                  value: 0.5,
                ),
              ],
            ),
            const Text('1/100'),
            const Text('Used by engineers and means nothing'),
            ListView.builder(
              itemBuilder: (context, index) {
                return AnswerCandidateCard(
                  word: wordList[index],
                  isCorrect: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AnswerCandidateCard extends StatelessWidget {
  const AnswerCandidateCard({
    Key? key,
    required this.word,
    required this.isCorrect,
  }) : super(key: key);

  final String word;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        title: Text(word),
      ),
    );
  }
}
