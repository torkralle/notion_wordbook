import 'package:flutter/material.dart';

class MyInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('My Info'),
        ),
        body: Center(
            child: Text(
          'My Info',
          style: TextStyle(fontSize: 60),
        )),
      );
}
