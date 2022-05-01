// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:

// 🌎 Project imports:
import 'package:notion_wordbook/client/words/main.dart';
import 'package:notion_wordbook/objects/enums/word_tag.dart';

// var dbKey = dotenv.env['DB_KEY'];

class HookPage extends StatefulWidget {
  const HookPage({Key? key}) : super(key: key);
  @override
  _HookPageState createState() => _HookPageState();
}

class _HookPageState extends State<HookPage> {
  ApiResult? result;
  List? wordsList;

  Future getData() async {
    // result = await getWordsData(dbKey ?? '');
    //状態が変化した場合によばれる
    // setState(() {
    //   wordsList = newWordsList(result!.body!);
    // });
  }

  // 非同期処理は、デフォルトでは呼び出し元は処理の完了を待ちませんが、
  // await キーワードをつけると完了を待つことができる。
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('テスト用ページです。'),
          backgroundColor: Colors.green,
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
                    (wordsList![index].tags.length != 0
                            ? WordTagHelper().name(wordsList![index].tags[0])
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
        ),);
  }
}
