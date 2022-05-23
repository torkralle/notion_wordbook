// 🐦 Flutter imports:

import 'package:flutter/material.dart';

class MyInfoPage extends StatelessWidget {
  const MyInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
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
            children: [
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
                children: const [
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, index) {
                  return const WordWithResult(
                    word: 'word',
                    meaning: 'meaning',
                    isMissed: true,
                  );
                },
              ),
            ],
          ),
        ),
      );
}

class ResultButton extends StatelessWidget {
  const ResultButton({
    Key? key,
    required this.text,
    required this.isLarge,
  }) : super(key: key);

  final String text;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: isLarge ? 300 : 145,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 119, 0, 255),
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: isLarge
                ? const Color.fromARGB(255, 255, 247, 254)
                : Colors.white,
            side: const BorderSide(
              color: Colors.black,
              width: 0.5,
            ),
            shape: const StadiumBorder(),
            elevation: isLarge ? 5.0 : 0.0,
          ),
        ),
      ),
    );
  }
}

class WordWithResult extends StatelessWidget {
  const WordWithResult({
    Key? key,
    required this.word,
    required this.meaning,
    required this.isMissed,
  }) : super(key: key);

  final String word;
  final String meaning;
  final bool isMissed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 226, 226, 226),
            width: 1.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  word,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5.0,
                  ),
                  child: Text(
                    meaning,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  isMissed ? 'MISS!!' : 'OK!',
                  style: TextStyle(
                    color: isMissed
                        ? const Color.fromRGBO(160, 0, 0, 1)
                        : const Color.fromARGB(255, 119, 0, 255),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
