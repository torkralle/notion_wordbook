import 'package:flutter/material.dart';

class WordBooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Wordbooks'),
        ),
        body: Center(
            child: Text(
          'Wordbooks',
          style: TextStyle(fontSize: 60),
        )),
      );
}
