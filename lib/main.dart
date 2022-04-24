// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌎 Project imports:
import 'package:notion_wordbook/screens/connecting.dart';
import 'package:notion_wordbook/screens/home.dart';
import 'package:notion_wordbook/screens/quiz_page/components/progress_text.dart';
import 'package:notion_wordbook/screens/quiz_page/quiz_page.dart';
import 'package:notion_wordbook/screens/wordbook_item.dart';
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
        '/home': (context) => HomePage(),
        '/connecting': (context) => ConnectingPage(),
        '/wordbook_item': (context) => WordBookItemPage(),
        '/quiz_page': (context) => QuizPage(),
        '/progress_text': (context) => const ProgressText(),
      },
      title: 'Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
