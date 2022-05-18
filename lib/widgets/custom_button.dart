// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.buttonLabel}) : super(key: key);
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[600],
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 25,
      ),
      child: Text(
        buttonLabel,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
