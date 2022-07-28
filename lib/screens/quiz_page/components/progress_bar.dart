// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/viewmodels/page_controllers.dart';
import 'package:notion_wordbook/viewmodels/word_list_controller.dart';

class ProgressBar extends ConsumerWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.read(currentPageProvider);
    final wordsList = ref.read(wordsListProvider);
    final maxPage = wordsList.length;
    return LinearProgressIndicator(
      value: currentPage / maxPage,
      minHeight: 5,
      color: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }
}
