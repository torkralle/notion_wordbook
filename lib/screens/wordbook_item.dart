// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class WordBookItemPage extends StatelessWidget {
  const WordBookItemPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          elevation: 10,
          title: const Text(
            '単語帳',
            style: TextStyle(
              fontSize: 27,
            ),
          ),
          backgroundColor: Colors.purple[800],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                WordBookItem(wordName: 'refrechment', meaning: '軽食'),
                WordBookItem(wordName: 'municipal', meaning: '市政の'),
                WordBookItem(wordName: 'refill', meaning: '（飲み物の）おかわり'),
                WordBookItem(wordName: 'premise', meaning: '建物'),
                WordBookItem(
                  wordName: 'remark',
                  meaning: '発言',
                ),
                WordBookItem(wordName: 'checkup', meaning: '健康診断/点検'),
                WordBookItem(wordName: 'fluctuate', meaning: '変動する'),
                WordBookItem(wordName: 'consecutive', meaning: '連続した'),
                WordBookItem(wordName: 'detour', meaning: '迂回路'),
                WordBookItem(wordName: 'streamline', meaning: '（仕事を）合理化する'),
              ],
            ),
          ),
        ),
      );
}

class WordBookItem extends StatelessWidget {
  const WordBookItem({
    Key? key,
    required this.wordName,
    required this.meaning,
  }) : super(key: key);

  final String wordName;
  final String meaning;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 17),
      margin: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(234, 255, 250, 254),
        border: Border.all(color: Colors.black, width: 0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  wordName,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Row(
                children: [
                  const Text(
                    'meaning：',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        meaning,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
