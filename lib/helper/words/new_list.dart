// 🌎 Project imports:
import 'package:notion_wordbook/helper/words/retrieve.dart';
import 'package:notion_wordbook/objects/models/word.dart';

List<Map<dynamic, dynamic>> extractWordsDataFromResponse(
  Map<dynamic, dynamic> response,
) {
  return response['results'].map((dynamic page) => page['properties']).toList();
}

List<Word> newWordsList(Map<dynamic, dynamic> response) {
  final List<dynamic> wordsData = extractWordsDataFromResponse(response);
  return wordsData
      .map(
        (dynamic w) => Word(
          getSpelling(w),
          getCorrect(w),
          getMeaning(w),
          getTags(w), getExampleSentence(w), getLink(w),),)
      .toList();
}
