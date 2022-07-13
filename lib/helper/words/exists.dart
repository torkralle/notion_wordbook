bool existsMeaning(dynamic wordData) {
  return wordData['Meaning']['rich_text'].length != 0;
}

bool existsExampleSentence(dynamic wordData) {
  return wordData['Example Sentence']['rich_text'].length != 0;
}

bool existsLink(dynamic wordData) {
  return wordData['Link']['rich_text'].length != 0;
}

bool existsTag(dynamic wordData) {
  return wordData['Tags']['multi_select'].length != 0;
}
