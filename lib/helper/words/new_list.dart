// 🌎 Project imports:
import 'package:notion_wordbook/helper/words/retrieve.dart';
import 'package:notion_wordbook/objects/models/word.dart';

List extractWordsDataFromResponse(Map response) {
  return response['results'].map((page) => page['properties']).toList();
}

List<WordModel> newWordsList(Map response) {
  final wordsData = extractWordsDataFromResponse(response);
  return wordsData
      .map((w) => WordModel(getSpelling(w), getCorrect(w), getMeaning(w),
          getTags(w), getExampleSentence(w), getLink(w),),)
      .toList();
}
