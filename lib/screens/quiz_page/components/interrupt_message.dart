import 'package:flutter/material.dart';

class InterruptMessage extends StatelessWidget {
  const InterruptMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      title: const Text(
        '中断',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Container(
        padding: const EdgeInsets.only(bottom: 20),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Color.fromARGB(255, 192, 192, 192),
            ),
          ),
        ),
        child: const Text(
          'ここまでの内容は保存せずにホームに戻ってもいいですか？',
          style: TextStyle(
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
            child: const Text(
              '続ける',
              style: TextStyle(
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
            child: const Text(
              '中断する',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 64, 0),
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
