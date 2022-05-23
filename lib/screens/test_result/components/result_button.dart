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
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 119, 0, 255),
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: isLarge
                ? const Color.fromARGB(255, 255, 247, 254)
                : Colors.white,
            side: const BorderSide(
              color: Colors.black,
              width: 0.5,
            ),
            shape: const StadiumBorder(),
            elevation: isLarge ? 5.0 : 0.0,
          ),
        ),
      ),
    );
  }
}
