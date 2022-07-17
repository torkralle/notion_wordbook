import 'package:flutter/material.dart';

class ResultButton extends StatelessWidget {
  const ResultButton({
    Key? key,
    required this.text,
    required this.isLarge,
  }) : super(key: key);

  final String text;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: isLarge ? 300 : 145,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: isLarge
                ? Theme.of(context).colorScheme.secondary
                : Colors.white,
            side: const BorderSide(
              color: Colors.black,
              width: 0.5,
            ),
            shape: const StadiumBorder(),
            elevation: isLarge ? 5.0 : 0.0,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
