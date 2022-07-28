import 'package:flutter/material.dart';

class InterruptMessage extends StatelessWidget {
  const InterruptMessage({
    Key? key,
    this.title,
    this.message,
    this.closeMessage,
  }) : super(key: key);

  final String? title;
  final String? message;
  final String? closeMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      title: Text(
        title ?? '中断',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      content: Container(
        padding: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.background,
            ),
          ),
        ),
        child: Text(
          message ?? 'ここまでの内容は保存せずにホームに戻ってもいいですか？',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      actions: <Widget>[
        // ボタン領域
        Container(
          margin: const EdgeInsets.only(
            bottom: 8,
            left: 32,
          ),
          child: TextButton(
            child: Text(
              closeMessage ?? '続ける',
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        const SizedBox(width: 45),
        Container(
          margin: const EdgeInsets.only(
            bottom: 8,
            right: 20,
          ),
          child: TextButton(
            child: Text(
              title ?? '中断する',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              '/',
              (Route<dynamic> route) => false,
            ),
          ),
        ),
      ],
    );
  }
}
