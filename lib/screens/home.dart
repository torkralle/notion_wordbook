// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final wordbook = <Map<String, dynamic>>[
    {'listName': 'はじめての英語', 'ratio': '23.4'},
    {'listName': '基礎からの英語', 'ratio': '78.2'},
    {'listName': '日常英語', 'ratio': '1.1'},
    {'listName': '高校英語', 'ratio': '45.3'},
    {'listName': 'NewYorkTimes', 'ratio': '0.5'},
    {'listName': 'CNN', 'ratio': '0'},
    {'listName': 'Academic', 'ratio': '52.7'} 
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
                itemCount: wordbook.length,
                itemBuilder: (BuildContext context, index) {
                  return BookCard(index: index, wordbook: wordbook);
                },
              ),
            ],
          ),
        ),
      );
}

class BookCard extends StatelessWidget {
  const BookCard({
    Key? key,
    required this.index,
    required this.wordbook,
  }) : super(key: key);

  final int index;
  final List<Map<String, dynamic>> wordbook;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 20,
      ),
      elevation: 2,
      color: const Color.fromARGB(234, 250, 241, 252),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/quiz_page');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              wordbook[index]['listName'],
              style: const TextStyle(
                fontSize: 19,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                '前回正答率 ' + wordbook[index]['ratio'],
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            leading: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Icon(
                Icons.circle_sharp,
                color: Colors.white,
                size: 20,
              ),
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
  }
}
