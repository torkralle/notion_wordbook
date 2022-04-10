// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class DefinitionText extends StatelessWidget {
  const DefinitionText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      softWrap: true,
      text: const TextSpan(
        text:
            'Used by engineers and means notihing, but it is common expression.',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 103, 20, 134),
        ),
      ),
    );
  }
}
