// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class WordBookItemPage extends StatelessWidget {
  const WordBookItemPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          elevation: 10,
          title: const Text(
            '単語帳',
            style: TextStyle(
              fontSize: 27,
            ),
          ),
          backgroundColor: Colors.purple[800],
        ),
        body: Container(),
      );
}
