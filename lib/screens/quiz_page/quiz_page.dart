// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:notion_wordbook/screens/quiz_page/components/answer_candidate_card.dart';
import 'package:notion_wordbook/screens/quiz_page/components/definition_text.dart';
import 'package:notion_wordbook/screens/quiz_page/components/interrupt_message.dart';
import 'package:notion_wordbook/screens/quiz_page/components/progress_bar.dart';
import 'package:notion_wordbook/screens/quiz_page/components/progress_text.dart';

class QuizPage extends StatelessWidget {
  QuizPage({Key? key}) : super(key: key);

  final word = <String>['refreshment', 'municipal', 'refill', 'premise'];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                pause(context);
              },
              child: const Icon(
                Icons.close,
                color: Colors.black,
                size: 33,
              ),
            ),
          ),
          centerTitle: true,
          toolbarHeight: 150,
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.only(right: 50),
            child: ProgressBar(),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          margin: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: ProgressText(),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 90, right: 60, left: 60),
                child: DefinitionText(),
              ),
              ChoiceList(word: word),
            ],
          ),
        ),
      );

  Future<dynamic> pause(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        return const InterruptMessage();
      },
    );
  }
}


class ChoiceList extends StatelessWidget {
  const ChoiceList({
    Key? key,
    required this.word,
  }) : super(key: key);

  final List<String> word;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (BuildContext context, index) {
          return AnswerCandidateCard(
            index: index,
            word: word,
            // isCorrect: true,
          );
        },
      ),
    );
  }
}
