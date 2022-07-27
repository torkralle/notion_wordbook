// 🐦 Flutter imports:
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/objects/models/word.dart';
// 🌎 Project imports:
import 'package:notion_wordbook/viewmodels/page_controllers.dart';
import 'package:notion_wordbook/viewmodels/word_choices_controller.dart';
import 'package:notion_wordbook/viewmodels/word_list_controller.dart';

class AnswerCandidateCard extends ConsumerWidget {
  const AnswerCandidateCard({
    Key? key,
    required this.index,
    required this.maxPage,
    required this.currentPage,
    required this.word,
    required this.correctWord,
  }) : super(key: key);

  final int index;
  final List<String> word;
  final int maxPage;
  final int currentPage;
  final Word correctWord;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String chosenWord = word[index];
    return SizedBox(
      height: 75,
      child: Card(
        margin: const EdgeInsets.symmetric(
          vertical: 7,
          horizontal: 40,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(
            color: Color.fromARGB(255, 205, 205, 205),
          ),
        ),
        child: InkWell(
          onTap: () {
            ref.read(currentPageProvider.notifier).pageCount();
            final int nextPage = currentPage + 1;
            ref.read(wordChoicesProvider.notifier).setRandomChoices(nextPage);
            Navigator.of(context).pushNamed('/quiz');
          },
          child: ListTile(
            title: Text(
              chosenWord,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: () {
              final bool isCorrect = chosenWord == correctWord.spelling;
              ref.read(currentPageProvider.notifier).pageCount();
              final int nextPage = currentPage + 1;

              /// 次ページの選択肢をランダムに取得
              ref.read(wordChoicesProvider.notifier).setRandomChoices(nextPage);

              /// 正誤判定してNotionDBを更新
              isCorrectDialog(context, isCorrect, chosenWord);
              ref.read(wordsListProvider.notifier).updateIsCorrect(
                    currentPage - 1,
                    chosenWord == correctWord.spelling,
                  );
            },
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

  Future<dynamic> isCorrectDialog(
    BuildContext context,
    bool isCorrect,
    String chosenWord,
  ) {
    return showDialog<Widget>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isCorrect ? '正解' : '不正解'),
          content: RichText(
            text: TextSpan(
              children: isCorrect
                  ? <TextSpan>[const TextSpan(text: 'Nice job!')]
                  : <TextSpan>[
                      TextSpan(
                        text: 'You chose ',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      TextSpan(
                        text: chosenWord,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Colors.red),
                      ),
                      TextSpan(
                        text: ',\n but ',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      TextSpan(
                        text: correctWord.spelling,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Colors.red),
                      ),
                      TextSpan(
                        text: ' was the right one.\nCan be better next time!',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Go on to the next word'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/quiz');
              },
            ),
          ],
        );
      },
    );
  }
}
