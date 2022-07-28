// 🐦 Flutter imports:
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
// 🌎 Project imports:
import 'package:notion_wordbook/viewmodels/page_controllers.dart';
import 'package:notion_wordbook/viewmodels/word_list_controller.dart';

class ProgressText extends ConsumerWidget {
  const ProgressText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.read(currentPageProvider);
    final wordsList = ref.read(wordsListProvider);
    final maxPage = wordsList.length;
    return Text(
      '$currentPage / $maxPage',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
