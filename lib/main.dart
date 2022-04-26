// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/screens/add_wordbook.dart';

// 🌎 Project imports:
import 'package:notion_wordbook/screens/connecting_page.dart';
import 'package:notion_wordbook/screens/home_page.dart';
import 'package:notion_wordbook/screens/test_page.dart';
import 'package:notion_wordbook/screens/wordbook_item_page.dart';
import 'package:notion_wordbook/widgets/bottom_navbar.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const NavigatedPages(),
        '/home': (context) => const HomePage(),
        '/connecting': (context) => ConnectingPage(),
        '/add_wordbook': (context) => AddWordbookPage(),
        '/wordbook_item': (context) => WordBookItemPage(),
        '/test': (context) => const TestPage()
      },
      title: 'Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
