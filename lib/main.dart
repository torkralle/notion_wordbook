// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:notion_wordbook/screens/connecting.dart';

// 🌎 Project imports:

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => NavigatedPages(),
        '/connecting': (context) => ConnectingPage(),
      },
      title: 'Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
