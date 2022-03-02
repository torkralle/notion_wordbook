class WordModel {
  String Spelling;
  String? Meaning = '', ExampleSentence = '', Link = '', Correct = '';
  List<WordTag>? Tags = [];
  WordModel(this.Spelling,
      [this.Meaning, this.Tags, this.ExampleSentence, this.Link, this.Correct]);
}

enum WordTag {
  Adjective,
  Idiom,
  Noun,
  Verb,
  Adverb,
  Abbreviation,
  Response,
  AuxiliaryVerb
}
