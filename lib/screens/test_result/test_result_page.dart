// 🐦 Flutter imports:

import 'package:flutter/material.dart';
import 'package:notion_wordbook/screens/test_result/components/result_button.dart';
import 'package:notion_wordbook/screens/test_result/components/result_list_item.dart';

class TestResultPage extends StatelessWidget {
  const TestResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _wordList = <String>['a', 'b', 'c'];
    final List<String> _meaningList = <String>['a', 'b', 'c'];
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          shape: const Border(
            bottom: BorderSide(
              color: Color.fromARGB(255, 226, 226, 226),
              width: 1.0,
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: const Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 5.0,
            ),
            child: Icon(
              Icons.close,
              color: Colors.black,
              size: 33,
            ),
          ),
          centerTitle: true,
          title: const Text(
            'テスト結果',
            style: TextStyle(
              color: Colors.black,
              fontSize: 27,
            ),
          ),
        ),
        body: Center(
          child: Column(
          children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(
                  top: 30,
                ),
                child: Text(
                  '本日の総学習単語',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 5.0,
                ),
                child: Text(
                  '2→12単語',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 30,
                ),
                child: Text(
                  '10/10',
                  style: TextStyle(
                    fontSize: 60,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 30,
                ),
                child: ResultButton(
                  text: 'もう一回テストする！',
                  isLarge: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                  ResultButton(
                    text: '間違えた単語',
                    isLarge: false,
                  ),
                  ResultButton(
                    text: '次の単語！',
                    isLarge: false,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: double.infinity,
                color: const Color.fromARGB(255, 247, 238, 255),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    '結果詳細',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _wordList.length,
                itemBuilder: (BuildContext context, int index) {     
                  return ResultListItem(
                    word: _wordList[index],
                    meaning: _meaningList[index],
                    isMissed: true,
                  );
                },
              ),
            ),
            ],
          ),
        ),
      );
  }
}
