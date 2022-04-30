// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌎 Project imports:
import 'package:notion_wordbook/client/words/word_data.dart';
import 'package:notion_wordbook/objects/models/word.dart';
import 'package:notion_wordbook/screens/hook_test_page.dart';

class WordListNotifier extends StateNotifier<List<Word>> {
  WordListNotifier() : super([]);

  Future readWordList() async {
    final data = WordData();

    final WordListResult wordListResult = await data.getWordList(dbKey ?? '');
    final List<Word>? wordList = wordListResult.wordList;

    state = wordList ?? [];
    print(wordListResult.statusMessage);
  }
}

final wordListStateProvider =
    StateNotifierProvider<WordListNotifier, List<Word>>((ref) {
  return WordListNotifier();
});
