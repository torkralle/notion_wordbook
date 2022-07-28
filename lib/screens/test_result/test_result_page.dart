// 🐦 Flutter imports:

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notion_wordbook/objects/models/word.dart';
import 'package:notion_wordbook/screens/quiz_page/components/interrupt_message.dart';
import 'package:notion_wordbook/screens/test_result/components/result_button.dart';
import 'package:notion_wordbook/screens/test_result/components/result_list_item.dart';
import 'package:notion_wordbook/viewmodels/result_detail_mode_controller.dart';
import 'package:notion_wordbook/viewmodels/word_list_controller.dart';
import 'package:notion_wordbook/viewmodels/words_learned_controller.dart';

class TestResultPage extends ConsumerWidget {
  const TestResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordList = ref.read(wordsListProvider);
    final incorrectList =
        wordList.where((Word word) => word.correct == false).toList();
    final correctCount =
        wordList.where((Word word) => word.correct == true).length;

    /// 学習状況を更新して、 [wordsLearned] に保存する。
    final wordsLearned = ref.read(wordsLearnedProvider);

    final resultListMode = ref.watch(resultListModeProvider);
    return Scaffold(
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 5,
          ),
          child: IconButton(
            onPressed: () {
              closeDialog(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
              size: 33,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'テスト結果',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                '本日の総学習単語',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
              ),
              child: Text(
                '${wordsLearned - wordList.length}→$wordsLearned単語',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                '$correctCount/${wordList.length}',
                style: Theme.of(context).textTheme.headlineLarge,
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
              children: <Widget>[
                ResultButton(
                  text: resultListMode == ResultListMode.all ? '間違えた単語' : '全単語',
                  isLarge: false,
                  onPressed: resultListMode == ResultListMode.all
                      ? ButtonFunction.showMissedOnly
                      : ButtonFunction.showAll,
                ),
                const ResultButton(
                  text: '次の単語帳！',
                  isLarge: false,
                  onPressed: ButtonFunction.nextBook,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: double.infinity,
              color: Theme.of(context).colorScheme.secondary,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  '結果詳細',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: resultListMode == ResultListMode.all
                    ? wordList.length
                    : incorrectList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ResultListItem(
                    word: resultListMode == ResultListMode.all
                        ? wordList[index].spelling
                        : incorrectList[index].spelling,
                    meaning: resultListMode == ResultListMode.all
                        ? wordList[index].meaning ?? ''
                        : resultListMode == ResultListMode.incorrect
                            ? incorrectList[index].meaning ?? ''
                            : '',
                    isMissed: resultListMode != ResultListMode.all ||
                        !wordList[index].correct,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> closeDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        return const InterruptMessage(
          title: '終了する',
          message: 'セッションを終了しますか？',
          closeMessage: '閉じる',
        );
      },
    );
  }
}
