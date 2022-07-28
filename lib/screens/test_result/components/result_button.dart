import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/screens/quiz_page/components/interrupt_message.dart';
import 'package:notion_wordbook/viewmodels/page_controllers.dart';
import 'package:notion_wordbook/viewmodels/result_detail_mode_controller.dart';

class ResultButton extends ConsumerWidget {
  const ResultButton({
    Key? key,
    required this.text,
    required this.isLarge,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final bool isLarge;
  final ButtonFunction onPressed;

  void testAgain(BuildContext context, WidgetRef ref) {
    ref.read(currentPageProvider.notifier).initState();
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/quiz',
      (Route<dynamic> route) => false,
    );
  }

  void showMissedOnly(WidgetRef ref) {
    ref
        .read(resultListModeProvider.notifier)
        .update(((ResultListMode state) => state = ResultListMode.incorrect));
  }

  void showAll(WidgetRef ref) {
    ref
        .read(resultListModeProvider.notifier)
        .update((ResultListMode state) => state = ResultListMode.all);
  }

  void quitSession(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return const InterruptMessage(
          title: '終了する',
          message: 'セッションを終了しますか？',
          closeMessage: '閉じる',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: isLarge ? 300 : 145,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            if (onPressed == ButtonFunction.testAgain) {
              return testAgain(context, ref);
            }
            if (onPressed == ButtonFunction.showMissedOnly) {
              return showMissedOnly(ref);
            }
            if (onPressed == ButtonFunction.showAll) {
              return showAll(ref);
            }
            if (onPressed == ButtonFunction.nextBook) {
              return quitSession(context);
            }
          },
          style: ElevatedButton.styleFrom(
            primary: isLarge
                ? Theme.of(context).colorScheme.secondary
                : Colors.white,
            side: const BorderSide(
              color: Colors.black,
              width: 0.5,
            ),
            shape: const StadiumBorder(),
            elevation: isLarge ? 5.0 : 0.0,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}

enum ButtonFunction {
  testAgain,
  showMissedOnly,
  showAll,
  nextBook,
}
