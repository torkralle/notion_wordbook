// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';
// 🌎 Project imports:
import 'package:notion_wordbook/client/words/main.dart';
import 'package:notion_wordbook/helper/words/new_list.dart';
import 'package:notion_wordbook/objects/enums/word_tag.dart';
import 'package:notion_wordbook/objects/models/word.dart';
// 📦 Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class HookPage extends StatefulWidget {
  const HookPage({Key? key}) : super(key: key);
  @override
  HookPageState createState() => HookPageState();
}

class HookPageState extends State<HookPage> {
  ApiResult? result;
  List<Word>? wordsList;
  int _counter = 0;

  Future<void> getData() async {
    result = await getWordsData('', '');

    //状態が変化した場合によばれる
    setState(() {
      wordsList = newWordsList(result!.body!);
    });
  }

  Future<void> _getDataFromSP() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  Future<void> _setCounterValue() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', _counter);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _setCounterValue();
    });
  }

  // 非同期処理は、デフォルトでは呼び出し元は処理の完了を待ちませんが、
  // await キーワードをつけると完了を待つことができる。
  @override
  void initState() {
    super.initState();
    getData();
    _getDataFromSP();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('テスト用ページです。$_counter'),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        //スクロール可能な可変リストを作る
        itemCount: wordsList == null ? 0 : wordsList!.length, //受け取る数の定義
        itemBuilder: (BuildContext context, int index) {
          //ここに表示したい内容をindexに応じて
          return Card(
            //cardデザインを定義:material_design
            child: Row(
              children: <Widget>[
                Text(
                  // "${userData![index]['Meaning']['rich_text'][0]['text']['content']}")
                  wordsList![index].spelling,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  // "${userData![index]['Meaning']['rich_text'][0]['text']['content']}")
                  (wordsList![index].tags!.isNotEmpty
                          ? WordTagHelper().name(wordsList![index].tags![0])
                          : '') ??
                      '',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
