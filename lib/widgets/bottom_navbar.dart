// 🐦 Flutter imports:
import 'package:flutter/material.dart';
// 🌎 Project imports:
import 'package:notion_wordbook/screens/add_wordbook_page.dart';
import 'package:notion_wordbook/screens/home_page.dart';

class NavigatedPages extends StatefulWidget {
  const NavigatedPages({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NavigatedPagesState();
  }
}

class _NavigatedPagesState extends State<NavigatedPages> {
  int _navIndex = 0;
  final List<Widget> screens = <Widget>[
    const HomePage(),
    // const ReviewPage(),
    // const TestResultPage(),
    AddWordbookPage(),
    // const HookPage(),
    // const MyPageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: '単語帳一覧'),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.mode_edit_outline),
          //   label: '復習',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.auto_graph),
          //   label: '学習データ',
          // ),
          BottomNavigationBarItem(icon: Icon(Icons.plus_one), label: '単語帳追加'),
          // BottomNavigationBarItem(icon: Icon(Icons.face), label: 'マイページ'),
        ],
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(
            () {
              _navIndex = index;
            },
          );
        },
        currentIndex: _navIndex,
      ),
      body: screens[_navIndex],
    );
  }
}
