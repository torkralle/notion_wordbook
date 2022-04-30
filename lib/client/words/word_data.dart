import 'dart:convert';
import 'package:notion_wordbook/core/http/main.dart';
import 'package:notion_wordbook/objects/models/word.dart';

class WordData {
  Future<WordListResult> getWordList(String databaseID) async {
    HttpResult result = await callPostMethod(databaseID + '/query');
    try {
      // final body =
      //     jsonDecode(json.decode(result.response!.body)) as List<dynamic>;
      body = json.decode(result.response!.body);
      print('ボディー$body');
      final wordList = body.map<Word>((word) => Word.fromJson(word)).toList();
      print('ワードリスト$wordList');
      return WordListResult.success(wordList, 'success');
    } catch (e) {
      return WordListResult.failure(null, e.toString());
    }
  }
}

class WordListResult {
  final List<Word>? wordList;
  final String statusMessage;
  WordListResult.success(this.wordList, this.statusMessage);
  WordListResult.failure(this.wordList, this.statusMessage);
}
