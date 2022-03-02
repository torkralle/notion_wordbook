import 'package:notion_wordbook/models/word.dart';

bool existsMeaning(wordsData, index) {
  return wordsData[index]['Meaning']['rich_text'].length != 0;
}

String getMeaning(wordsData, index) {
  return wordsData[index]['Meaning']['rich_text'][0]['text']['content'];
}

String getMeaningFromWord(word) {
  return word['Meaning']['rich_text'][0]['text']['content'];
}

String getSpelling(wordData) {
  return wordData['Spelling']['title'][0]['text']['content'];
}

bool existsExampleSentence(wordsData, index) {
  return wordsData[index]['Example Sentence']['rich_text'].length != 0;
}

String getExampleSentence(wordsData, index) {
  return wordsData[index]['Example Sentence']['rich_text'][0]['text']
      ['content'];
}

List extractWordsDataFromResponse(Map response) {
  return response["results"].map((page) => page['properties']).toList();
}

List<WordModel> makeArray(List wordsData) {
  return wordsData.map((word) => WordModel(getSpelling(word))).toList();
}
