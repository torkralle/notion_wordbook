// 🌎 Project imports:
import 'package:notion_wordbook/helper/words/retrieve.dart';
import 'package:notion_wordbook/objects/models/word.dart';

List<Map<String, dynamic>> extractWordsDataFromResponse(
  Map<String, dynamic> responseMap,
) {
  return responseMap['results'].map((Map<String, dynamic> page) {
    Map<String, dynamic> p = page['properties'];
    p.addAll(<String, dynamic>{'id': page['id']});
    return p;
  }).toList();
}

List<Word> newWordsList(Map<String, dynamic> response) {
  final List<Map<String, dynamic>> wordsData =
      extractWordsDataFromResponse(response);
  return wordsData
      .map(
        (Map<String, dynamic> w) => Word(
          getPageId(w),
          getSpelling(w),
          getCorrect(w),
          getMeaning(w),
          getTags(w),
          getExampleSentence(w),
          getLink(w),
        ),
      )
      .toList();
}
