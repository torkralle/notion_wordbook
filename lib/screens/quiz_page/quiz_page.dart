// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:notion_wordbook/screens/quiz_page/components/answer_candidate_card.dart';
import 'package:notion_wordbook/screens/quiz_page/components/definition_text.dart';
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
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      title: const Text(
                        '中断',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 192, 192, 192),
                            ),
                          ),
                        ),
                        child: const Text(
                          'ここまでの内容は保存せずにホームに戻ってもいいですか？',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        // ボタン領域
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 8,
                            left: 32,
                          ),
                          child: TextButton(
                            child: const Text(
                              '続ける',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        const SizedBox(width: 45),
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 8,
                            right: 20,
                          ),
                          child: TextButton(
                            child: const Text(
                              '中断する',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 64, 0),
                              ),
                            ),
                            onPressed: () =>
                                Navigator.pushNamedAndRemoveUntil(
                                context, '/', (route) => false,),
                          ),
                        ),
                      ],
                    );
                  },
                );
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
