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
import 'package:notion_wordbook/screens/test_result/test_result_page.dart';
import 'package:notion_wordbook/screens/wordbook_item_page.dart';
import 'package:notion_wordbook/widgets/bottom_navbar.dart';

// 🌎 Project imports:

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, Widget Function(BuildContext)>{
        '/': (BuildContext context) => const NavigatedPages(),
        '/home': (BuildContext context) => const HomePage(),
        '/connecting': (BuildContext context) => ConnectingPage(),
        '/add_wordbook': (BuildContext context) => AddWordbookPage(),
        '/wordbook_item': (BuildContext context) => const WordBookItemPage(),
        '/quiz': (BuildContext context) => const QuizPage(),
        '/progress_text': (BuildContext context) => const ProgressText(),
        '/result': (BuildContext context) => const TestResultPage(),
      },
      title: 'Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
