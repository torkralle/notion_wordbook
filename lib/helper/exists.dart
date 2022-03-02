bool existsMeaning(wordData) {
  return wordData['Meaning']['rich_text'].length != 0;
}

bool existsExampleSentence(wordData) {
  return wordData['Example Sentence']['rich_text'].length != 0;
}

bool existsLink(wordData) {
  return wordData['Link']['rich_text'].length != 0;
}

bool existsTag(wordData) {
  return wordData['Tags']['multi_select'].length != 0;
}
