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
      text: TextSpan(
        text:
            'Used by engineers and means notihing, but it is common expression.',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
