// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/viewmodels/page_controllers.dart';

class ProgressBar extends ConsumerWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(currentPageProvider);
    final maxPage = ref.watch(maxPageProvider);
    return LinearProgressIndicator(
      value: currentPage / maxPage,
      minHeight: 5,
      color: const Color.fromARGB(255, 112, 33, 181),
      backgroundColor: const Color.fromARGB(255, 244, 235, 248),
    );
  }
}
