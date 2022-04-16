// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class ProgressText extends StatelessWidget {
  const ProgressText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '1/100',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 103, 20, 134),
      ),
    );
  }
}
