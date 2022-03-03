// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: const Center(
            child: Text(
          'Home',
          style: TextStyle(fontSize: 60),
        ),),
      );
}
