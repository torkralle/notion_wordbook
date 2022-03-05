// ここはまだ考慮の余地あり
// 🌎 Project imports
import 'package:notion_wordbook/helper/enum.dart';

enum WordTag {
  adjective,
  idiom,
  noun,
  verb,
  adverb,
  abbreviation,
  response,
  auxiliaryVerb
}

class WordTagHelper extends EnumHelper<WordTag> {
  @override
  List<WordTag> values() => WordTag.values;
}
