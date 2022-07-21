// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/objects/models/word.dart';
import 'package:notion_wordbook/viewmodels/page_controllers.dart';
import 'package:notion_wordbook/viewmodels/word_list_controller.dart';

class DefinitionText extends ConsumerWidget {
  const DefinitionText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int currentPage = ref.read(currentPageProvider);
    final Word word = ref.read(wordsListProvider)[currentPage - 1];
    return RichText(
      textAlign: TextAlign.center,
      softWrap: true,
      text: TextSpan(
        text: word.meaning,
        style: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 103, 20, 134),
        ),
      ),
    );
  }
}
