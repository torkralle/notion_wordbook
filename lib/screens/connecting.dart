import 'package:flutter/material.dart';

class ConnectingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Connecting'),
        ),
        body: Center(
            child: Text(
          'Connecting',
          style: TextStyle(fontSize: 60),
        )),
      );
}
