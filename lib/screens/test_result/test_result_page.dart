// π¦ Flutter imports:

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
    final List<Word> wordList = ref.read(wordsListProvider);
    final List<Word> incorrectList =
        wordList.where((Word word) => word.correct == false).toList();
    final int correctCount =
        wordList.where((Word word) => word.correct == true).length;

    /// ε­¦ηΏηΆζ³γζ΄ζ°γγ¦γ [wordsLearned] γ«δΏε­γγγ
    final int wordsLearned = ref.read(wordsLearnedProvider);

    ResultListMode resultListMode = ref.watch(resultListModeProvider);
    return Scaffold(
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1.0,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 5.0,
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
          'γγΉγη΅ζ',
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
                'ζ¬ζ₯γ?η·ε­¦ηΏεθͺ',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5.0,
              ),
              child: Text(
                '${wordsLearned - wordList.length}β$wordsLearnedεθͺ',
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
                text: 'γγδΈεγγΉγγγοΌ',
                isLarge: true,
                onPressed: ButtonFunction.testAgain,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ResultButton(
                  text: resultListMode == ResultListMode.all ? 'ιιγγεθͺ' : 'ε¨εθͺ',
                  isLarge: false,
                  onPressed: resultListMode == ResultListMode.all
                      ? ButtonFunction.showMissedOnly
                      : ButtonFunction.showAll,
                ),
                const ResultButton(
                  text: 'ζ¬‘γ?εθͺεΈ³οΌ',
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
                  'η΅ζθ©³η΄°',
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
                    isMissed: resultListMode == ResultListMode.all
                        ? !wordList[index].correct
                        : true,
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
          title: 'η΅δΊγγ',
          message: 'γ»γγ·γ§γ³γη΅δΊγγΎγγοΌ',
          closeMessage: 'ιγγ',
        );
      },
    );
  }
}
