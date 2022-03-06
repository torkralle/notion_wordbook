// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌎 Project imports:
import 'package:notion_wordbook/screens/connecting.dart';
import 'package:notion_wordbook/screens/home.dart';
import 'package:notion_wordbook/widgets/bottom_navbar.dart';

// 🌎 Project imports:

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => NavigatedPages(),
        '/home': (context) => const HomePage(),
        '/connecting': (context) => ConnectingPage(),
      },
      title: 'Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
