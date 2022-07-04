// 🌎 Project imports:
import 'package:notion_wordbook/helper/words/retrieve.dart';
import 'package:notion_wordbook/objects/models/word.dart';

List extractWordsDataFromResponse(Map response) {
  return response['results'].map((page) {
    Map<String, dynamic> p = page['properties'];
    p.addAll({'id': page['id']});
    return p;
  }).toList();
}

List<Word> newWordsList(Map response) {
  final wordsData = extractWordsDataFromResponse(response);
  return wordsData
      .map(
        (w) => Word(
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
