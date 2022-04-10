// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text(
            'Test',
            style: TextStyle(fontSize: 60),
          ),
        ),
      );
}
