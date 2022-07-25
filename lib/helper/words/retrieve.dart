// 🌎 Project imports:
import 'package:notion_wordbook/helper/words/exists.dart';
import 'package:notion_wordbook/objects/enums/word_tag.dart';

String getPageId(wordData) {
  return wordData['id'];
}

String getSpelling(wordData) {
  return wordData['Spelling']['title'][0]['text']['content'];
}

String getMeaning(dynamic wordData) {
  return existsMeaning(wordData)
      ? wordData['Meaning']['rich_text'][0]['text']['content']
      : '';
}

String getExampleSentence(dynamic wordData) {
  return existsExampleSentence(wordData)
      ? wordData['Example Sentence']['rich_text'][0]['text']['content']
      : '';
}

String getLink(dynamic wordData) {
  return existsLink(wordData)
      ? wordData['Link']['rich_text'][0]['text']['content']
      : '';
}

bool getCorrect(dynamic wordData) {
  return wordData['Correct']['checkbox'];
}

List<WordTag> getTags(dynamic wordData) {
  return existsTag(wordData)
      ? wordData['Tags']['multi_select']
          .map<WordTag>(
            (dynamic tag) => WordTagHelper().valueOf(tag['name'].toString()),
          )
          .toList()
      : <WordTag>[];
}
