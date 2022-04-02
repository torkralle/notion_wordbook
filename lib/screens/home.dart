// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _wordbook = <Map<String, dynamic>>[
    {'rank': 'A', 'listName': 'はじめての英語', 'ratio': '23.4'},
    {'rank': 'B', 'listName': '基礎からの英語', 'ratio': '78.2'},
    {'rank': 'C', 'listName': '日常英語', 'ratio': '1.1'},
    {'rank': 'A', 'listName': '高校英語', 'ratio': '45.3'},
    {'rank': 'D', 'listName': 'NewYorkTimes', 'ratio': '0.5'},
    {'rank': 'D', 'listName': 'CNN', 'ratio': '0'},
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          elevation: 10,
          title: const Text(
            '単語帳一覧',
            style: TextStyle(
              fontSize: 27,
            ),
          ),
          backgroundColor: Colors.purple[800],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 30),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/connecting');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 90,
                    ),
                    color: const Color.fromARGB(255, 233, 225, 240),
                    child: const Text(
                      '単語帳を追加',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _wordbook.length,
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 20,
                    ),
                    elevation: 2,
                    color: const Color.fromARGB(234, 250, 241, 252),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/test');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            _wordbook[index]['listName'],
                            style: const TextStyle(
                              fontSize: 19,
                            ),
                          ),
                          subtitle: Text(
                            '前回正答率 ' + _wordbook[index]['ratio'],
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          leading: const Icon(
                            Icons.circle_sharp,
                            color: Colors.white,
                            size: 20,
                          ),
                          trailing: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/wordbook_item');
                            },
                            child: const Icon(Icons.more_horiz),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
}

