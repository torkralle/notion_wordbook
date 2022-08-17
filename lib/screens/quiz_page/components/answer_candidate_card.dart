// 🐦 Flutter imports:
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/objects/models/word.dart';
// 🌎 Project imports:
import 'package:notion_wordbook/viewmodels/page_controllers.dart';
import 'package:notion_wordbook/viewmodels/word_choices_controller.dart';
import 'package:notion_wordbook/viewmodels/word_list_controller.dart';
import 'package:notion_wordbook/viewmodels/words_learned_controller.dart';

class AnswerCandidateCard extends ConsumerStatefulWidget {
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
  AnswerCandidateCardState createState() => AnswerCandidateCardState();
}

class AnswerCandidateCardState extends ConsumerState<AnswerCandidateCard> {
  @override
  Widget build(BuildContext context) {
    final String chosenWord = widget.word[widget.index];
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
          onTap: () async {
            if (widget.currentPage >= widget.maxPage) {
              final List<Word> wordList = ref.read(wordsListProvider);
              // ここで学んだ単語数をロードする。
              await ref
                  .read(wordsLearnedProvider.notifier)
                  .update(wordList.length);
              if (!mounted) return;
              Navigator.of(context).pushNamed('/result');
              return;
            }
            ref.read(currentPageProvider.notifier).pageCount();
            final int nextPage = widget.currentPage + 1;
            ref.read(wordChoicesProvider.notifier).setRandomChoices(nextPage);
            Navigator.of(context).pushNamed('/quiz');
          },
          child: ListTile(
            title: Text(
              chosenWord,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: () async {
              final bool isCorrect = chosenWord == widget.correctWord.spelling;
              if (widget.currentPage >= widget.maxPage) {
                final List<Word> wordList = ref.read(wordsListProvider);
                // ここで学んだ単語数をロードする。
                await ref
                    .read(wordsLearnedProvider.notifier)
                    .update(wordList.length);
                if (!mounted) return;
                isCorrectDialog(context, isCorrect, chosenWord, '/result');
                return;
              }
              ref.read(currentPageProvider.notifier).pageCount();
              final int nextPage = widget.currentPage + 1;

              /// 次ページの選択肢をランダムに取得
              ref.read(wordChoicesProvider.notifier).setRandomChoices(nextPage);

              /// 正誤判定してNotionDBを更新
              isCorrectDialog(context, isCorrect, chosenWord, '/quiz');
              ref.read(wordsListProvider.notifier).updateIsCorrect(
                    widget.currentPage - 1,
                    chosenWord == widget.correctWord.spelling,
                  );
            },
            leading: Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 6),
              child: Text(
                (widget.index + 1).toString(),
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
    String nextRoute,
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
                  ? <TextSpan>[
                      TextSpan(
                        text: 'Nice job!',
                        style: Theme.of(context).textTheme.displayMedium,
                      )
                    ]
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
                        text: widget.correctWord.spelling,
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
                Navigator.of(context).pushNamed(nextRoute);
              },
            ),
          ],
        );
      },
    );
  }
}
