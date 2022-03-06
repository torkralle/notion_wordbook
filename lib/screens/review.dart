// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Review'),
        ),
        body: const Center(
            child: Text(
          'Review',
          style: TextStyle(fontSize: 60),
        ),),
      );
}
