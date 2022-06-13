// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/client/words/main.dart';

// 🌎 Project imports:
import 'package:notion_wordbook/helper/words/new_list.dart';
import 'package:notion_wordbook/objects/models/word.dart';
import 'package:notion_wordbook/screens/hook_test_page.dart';

class WordListNotifier extends StateNotifier<List<Word>> {
  WordListNotifier() : super([]);

  Future readWordList() async {
    final ApiResult wordListResult = await getWordsData(dbKey ?? '', '');
    final List<Word> wordList = newWordsList(wordListResult.body!);

    state = wordList;
  }
}

final wordListStateProvider =
    StateNotifierProvider<WordListNotifier, List<Word>>((ref) {
  return WordListNotifier();
});

final wordListFutureProvider = FutureProvider<List<Word>>((ref) async {
  final ApiResult wordListResult = await getWordsData(dbKey ?? '', '');
  final List<Word> wordList = newWordsList(wordListResult.body!);

  return wordList;
});
