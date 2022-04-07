// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class WordBookItemPage extends StatelessWidget {
  WordBookItemPage({Key? key}) : super(key: key);

  final word = <Map<String, dynamic>>[
    {'wordName': 'refreshment', 'meaning': '軽食'},
    {'wordName': 'municipal', 'meaning': '市政の'},
    {'wordName': 'refill', 'meaning': '(飲み物の)おかわり'},
    {'wordName': 'premise', 'meaning': '建物'},
    {
      'wordName': 'remark',
      'meaning': '発言',
    },
    {'wordName': 'checkup', 'meaning': '健康診断/点検'},
    {'wordName': 'fluctuate', 'meaning': '変動する'},
    {'wordName': 'consecutive', 'meaning': '連続した'},
    {'wordName': 'detour', 'meaning': '迂回路'},
    {'wordName': 'streamline', 'meaning': '(仕事を)合理化する'},
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
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
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: word.length,
              itemBuilder: (BuildContext context, index) {
                return WordCard(index: index, word: word);
              },
            ),
          ),
        ),
      );
}

class WordCard extends StatelessWidget {
  const WordCard({
    Key? key,
    required this.index,
    required this.word,
  }) : super(key: key);

  final int index;
  final List<Map<String, dynamic>> word;

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            word[index]['wordName'],
            style: const TextStyle(
              fontSize: 23,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              word[index]['meaning'],
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          leading: const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Icon(
              Icons.circle_sharp,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
