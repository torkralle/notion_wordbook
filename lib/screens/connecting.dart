// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class ConnectingPage extends StatelessWidget {
  const ConnectingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Connecting'),
        ),
        body: const Center(
            child: Text(
          'Connecting',
          style: TextStyle(fontSize: 60),
        )),
      );
}
