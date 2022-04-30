// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Review'),
        ),
        body: const Center(
          child: Text(
            'Review',
            style: TextStyle(fontSize: 60),
          ),
        ),
      );
}
