// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LinearProgressIndicator(
      value: 0.5,
      minHeight: 5,
      color: Color.fromARGB(255, 112, 33, 181),
      backgroundColor: Color.fromARGB(255, 244, 235, 248),
    );
  }
}
