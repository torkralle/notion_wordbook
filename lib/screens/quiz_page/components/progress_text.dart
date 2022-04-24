// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/viewmodels/page_controllers.dart';

class ProgressText extends ConsumerWidget {
  const ProgressText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(currentPageProvider);
    final maxPage = ref.watch(maxPageProvider);
    return Text(
      currentPage.toString() + '/' + maxPage.toString(),
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 103, 20, 134),
      ),
    );
  }
}
