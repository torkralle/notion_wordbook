// 🐦 Flutter imports:
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
// 🌎 Project imports:
import 'package:notion_wordbook/screens/add_wordbook_page.dart';
import 'package:notion_wordbook/screens/connecting_page.dart';
import 'package:notion_wordbook/screens/home_page.dart';
import 'package:notion_wordbook/screens/quiz_page/components/progress_text.dart';
import 'package:notion_wordbook/screens/quiz_page/quiz_page.dart';
import 'package:notion_wordbook/screens/wordbook_item_page.dart';
import 'package:notion_wordbook/widgets/bottom_navbar.dart';
import 'package:notion_wordbook/widgets/themes.dart';

// 🌎 Project imports:

void main() async {
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
        '/wordbook_item': (context) => const WordBookItemPage(),
        '/quiz': (context) => const QuizPage(),
        '/progress_text': (context) => const ProgressText(),
      },
      title: 'Navigation',
      theme: notionWordbookTheme,
    );
  }
}
