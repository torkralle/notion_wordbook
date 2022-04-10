// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌎 Project imports:
import 'package:notion_wordbook/client/words/main.dart';
import 'package:notion_wordbook/screens/hook_test.dart';

class WordListNotifier extends StateNotifier<Map> {
  WordListNotifier() : super({});

  Future getWordList() async {
    final wordListResult = await getWordsData(dbKey ?? '');
    final wordList = wordListResult.body;

    state = wordList ?? {};
  }
}

final wordListStateProvider =
    StateNotifierProvider<WordListNotifier, Map>((ref) {
  return WordListNotifier();
});
