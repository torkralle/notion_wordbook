import 'package:notion_wordbook/models/enums/word_tag.dart';

class WordModel {
  String spelling;
  String? meaning, exampleSentence, link;
  // 正誤判定はAPIのJSON構造から必ず存在する
  bool correct;
  List<WordTag>? tags = [];
  WordModel(this.spelling, this.correct, this.meaning, this.tags,
      this.exampleSentence, this.link);
}
