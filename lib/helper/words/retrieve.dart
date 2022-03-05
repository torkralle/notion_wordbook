import 'package:notion_wordbook/objects/enums/ward_tag.dart';
import 'package:notion_wordbook/helper/words/exists.dart';

String getSpelling(wordData) {
  return wordData['Spelling']['title'][0]['text']['content'];
}

String getMeaning(wordData) {
  return existsMeaning(wordData)
      ? wordData['Meaning']['rich_text'][0]['text']['content']
      : '';
}

String getExampleSentence(wordData) {
  return existsExampleSentence(wordData)
      ? wordData['Example Sentence']['rich_text'][0]['text']['content']
      : '';
}

String getLink(wordData) {
  return existsLink(wordData)
      ? wordData['Link']['rich_text'][0]['text']['content']
      : '';
}

bool getCorrect(wordData) {
  return wordData['Correct']['checkbox'];
}

List<WordTag> getTags(wordData) {
  return existsTag(wordData)
      ? wordData['Tags']['multi_select']
          .map<WordTag>(
              (tag) => WordTagHelper().valueOf(tag['name'].toString()))
          .toList()
      : <WordTag>[];
}
