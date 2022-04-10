// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:notion_wordbook/screens/quiz_page/components/answer_candidate_card.dart';
import 'package:notion_wordbook/screens/quiz_page/components/definition_text.dart';
import 'package:notion_wordbook/screens/quiz_page/components/progress_bar.dart';
import 'package:notion_wordbook/screens/quiz_page/components/progress_text.dart';

class QuizPage extends StatelessWidget {
  QuizPage({Key? key}) : super(key: key);

  final word = <String>['a', 'b', 'c', 'd'];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.close,
              color: Colors.black,
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
          margin: const EdgeInsets.only(top: 90, right: 20, left: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: ProgressText(),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 70, right: 60, left: 60),
                child: DefinitionText(),
              ),
              Flexible(
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
              ),
            ],
          ),
        ),
      );
}
