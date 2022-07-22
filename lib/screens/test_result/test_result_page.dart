// 🐦 Flutter imports:

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notion_wordbook/objects/models/word.dart';
import 'package:notion_wordbook/screens/test_result/components/result_button.dart';
import 'package:notion_wordbook/screens/test_result/components/result_list_item.dart';
import 'package:notion_wordbook/viewmodels/word_list_controller.dart';

class TestResultPage extends ConsumerWidget {
  const TestResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Word> wordList = ref.read(wordsListProvider);
    final int correctCount =
        wordList.where((Word word) => word.correct == true).length;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        shape: const Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 226, 226, 226),
            width: 1.0,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.only(
            left: 20,
            top: 5.0,
          ),
          child: Icon(
            Icons.close,
            color: Colors.black,
            size: 33,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'テスト結果',
          style: TextStyle(
            color: Colors.black,
            fontSize: 27,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                '本日の総学習単語',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5.0,
              ),
              child: Text(
                '${ref.read(previousCorrectCountProvider)}→$correctCount単語',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                '$correctCount/${wordList.length}',
                style: const TextStyle(
                  fontSize: 60,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 30,
              ),
              child: ResultButton(
                text: 'もう一回テストする！',
                isLarge: true,
                onPressed: ButtonFunction.testAgain,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                ResultButton(
                  text: '間違えた単語',
                  isLarge: false,
                  onPressed: ButtonFunction.showMissedOnly,
                ),
                ResultButton(
                  text: '次の単語帳！',
                  isLarge: false,
                  onPressed: ButtonFunction.nextBook,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: double.infinity,
              color: const Color.fromARGB(255, 247, 238, 255),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  '結果詳細',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: wordList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ResultListItem(
                    word: wordList[index].spelling,
                    meaning: wordList[index].meaning ?? '',
                    isMissed: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
