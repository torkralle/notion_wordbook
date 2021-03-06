// ๐ฏ Dart imports:
import 'dart:async';

// ๐ฆ Flutter imports:
import 'package:flutter/material.dart';
// ๐ Project imports:
import 'package:notion_wordbook/client/words/main.dart';
import 'package:notion_wordbook/helper/words/new_list.dart';
import 'package:notion_wordbook/objects/enums/word_tag.dart';
import 'package:notion_wordbook/objects/models/word.dart';
// ๐ฆ Package imports:
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

    //็ถๆใๅคๅใใๅ ดๅใซใใฐใใ
    setState(() {
      wordsList = newWordsList(result!.body!);
    });
  }

  Future<void> _getDataFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  void _setCounterValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', _counter);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _setCounterValue();
    });
  }

  // ้ๅๆๅฆ็ใฏใใใใฉใซใใงใฏๅผใณๅบใๅใฏๅฆ็ใฎๅฎไบใๅพใกใพใใใใ
  // awaitโใญใผใฏใผใใใคใใใจๅฎไบใๅพใคใใจใใงใใใ
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
        title: Text('ใในใ็จใใผใธใงใใ$_counter'),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        //ในใฏใญใผใซๅฏ่ฝใชๅฏๅคใชในใใไฝใ
        itemCount: wordsList == null ? 0 : wordsList!.length, //ๅใๅใๆฐใฎๅฎ็พฉ
        itemBuilder: (BuildContext context, int index) {
          //ใใใซ่กจ็คบใใใๅๅฎนใindexใซๅฟใใฆ
          return Card(
            //cardใใถใคใณใๅฎ็พฉ:material_design
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
