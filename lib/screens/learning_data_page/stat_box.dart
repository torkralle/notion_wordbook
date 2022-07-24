import 'package:flutter/material.dart';

class StatBox extends StatelessWidget {
  const StatBox({
    Key? key,
    required this.isLarge,
    required this.title,
    required this.stat,
    required this.unit,
  }) : super(key: key);
  final bool isLarge;
  final String title;
  final int stat;
  final String unit;

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Container(
      width: isLarge ? deviceSize.width - 40 : deviceSize.width / 2 - 30,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 17),
            ),
            Text(
              '$stat $unit',
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
