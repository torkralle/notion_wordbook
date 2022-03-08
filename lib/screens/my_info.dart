// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class MyInfoPage extends StatelessWidget {
  const MyInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('My Info'),
        ),
        body: const Center(
            child: Text(
          'My Info',
          style: TextStyle(fontSize: 60),
        ),),
      );
}
