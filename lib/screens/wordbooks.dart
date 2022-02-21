// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class WordBooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Wordbooks'),
        ),
        body: const Center(
            child: Text(
          'Wordbooks',
          style: TextStyle(fontSize: 60),
        )),
      );
}
