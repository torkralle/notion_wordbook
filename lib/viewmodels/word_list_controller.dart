// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/client/words/main.dart';

// 🌎 Project imports:
import 'package:notion_wordbook/helper/words/new_list.dart';
import 'package:notion_wordbook/objects/models/word.dart';
import 'package:notion_wordbook/viewmodels/wordbook_info.dart';
import 'package:notion_wordbook/screens/hook_test_page.dart';

class WordsListViewModel extends StateNotifier<List<Word>> {
  WordsListViewModel(this.ref) : super([]);
  Ref ref;

  Future<void> initState() async {
    final wordbookInfo = ref.watch(wordbookInfoProvider);
    final ApiResult result =
        await getWordsData(wordbookInfo.dbID, wordbookInfo.apiKey);
    state = newWordsList(result.body!);
  }

  getWordsList() {
    return state;
  }
}

final wordsListProvider =
    StateNotifierProvider<WordsListViewModel, List<Word>>((ref) {
  return WordsListViewModel(ref);
});

final wordsListFutureProvider = FutureProvider<List<Word>>((ref) async {
  final wordbookInfo = ref.watch(wordbookInfoProvider);
  final ApiResult wordListResult =
      await getWordsData(wordbookInfo.dbID, wordbookInfo.apiKey);
  final List<Word> wordList = newWordsList(wordListResult.body!);

  return wordList;
});
