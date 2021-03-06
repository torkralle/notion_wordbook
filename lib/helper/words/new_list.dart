// 🌎 Project imports:
import 'package:notion_wordbook/helper/words/retrieve.dart';
import 'package:notion_wordbook/objects/models/word.dart';

List<dynamic> extractWordsDataFromResponse(
  Map<dynamic, dynamic> responseMap,
) {
  return responseMap['results'].map((dynamic page) {
    Map<String, dynamic> p = page['properties'];
    p.addAll(<String, dynamic>{'id': page['id']});
    return p;
  }).toList();
}

List<Word> newWordsList(Map<dynamic, dynamic> response) {
  final List<dynamic> wordsData =
      extractWordsDataFromResponse(response);
  return wordsData
      .map(
        (dynamic w) => Word(
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
