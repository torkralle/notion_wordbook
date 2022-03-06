// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:notion_wordbook/screens/connecting.dart';
import 'package:notion_wordbook/widgets/bottom_navbar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// 🌎 Project imports:

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const NavigatedPages(),
        '/connecting': (context) => const ConnectingPage(),
      },
      title: 'Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
