// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'package:notion_wordbook/screens/quiz_page/components/answer_candidate_card.dart';
import 'package:notion_wordbook/screens/quiz_page/components/definition_text.dart';
import 'package:notion_wordbook/screens/quiz_page/components/interrupt_message.dart';
import 'package:notion_wordbook/screens/quiz_page/components/progress_bar.dart';
import 'package:notion_wordbook/screens/quiz_page/components/progress_text.dart';
import 'package:notion_wordbook/viewmodels/word_choices_controller.dart';

import 'package:notion_wordbook/viewmodels/page_controllers.dart';
import 'package:notion_wordbook/viewmodels/word_list_controller.dart';

class QuizPage extends HookConsumerWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordsList = ref.watch(wordsListProvider);
    final currentPage = ref.watch(currentPageProvider);
    // 正誤判定に使う
    // ignore: unused_local_variable
    final answerWord = wordsList[currentPage - 1];
    final maxPage = wordsList.length;
    final word = ref.watch(wordChoicesProvider);

    return Scaffold(
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
            ChoiceList(
              word: word,
              currentPage: currentPage,
              maxPage: maxPage,
            ),
          ],
        ),
      ),
    );
  }

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
    required this.currentPage,
    required this.maxPage,
  }) : super(key: key);

  final List<String> word;
  final int maxPage;
  final int currentPage;

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
            maxPage: maxPage,
            currentPage: currentPage,
            // isCorrect: true,
          );
        },
      ),
    );
  }
}
