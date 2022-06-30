// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notion_wordbook/viewmodels/loading_controller.dart';

class CustomButton extends HookConsumerWidget {
  const CustomButton({
    Key? key,
    required this.buttonLabel,
  }) : super(key: key);
  final String buttonLabel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.purple[600],
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 25,
      ),
      // ロード中はボタンの中身を [CircularProgressIndicator] にする
      child: ref.watch(loadingNotifierProvider)
          ? const CircularProgressIndicator()
          : Text(
              buttonLabel,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
    );
  }
}
