// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/client/words/main.dart';
// 🌎 Project imports:
import 'package:notion_wordbook/helper/words/new_list.dart';
import 'package:notion_wordbook/objects/models/word.dart';
import 'package:notion_wordbook/viewmodels/wordbook_info.dart';

class WordsListViewModel extends StateNotifier<List<Word>> {
  WordsListViewModel(this.ref) : super([]);
  Ref ref;

  Future<void> initState() async {
    final wordbookInfo =
        ref.watch(wordbookInfoProvider.notifier).getWordBookInfo();
    final ApiResult result =
        await getWordsData(wordbookInfo.dbID, wordbookInfo.apiKey);
    state = newWordsList(result.body!);
  }

  getWordsList() {
    return state;
  }

  List<String> getRandomWords(int currentPage) {
    final maxPage = state.length;
    if (maxPage < 4) {
      var choices = [
        state[currentPage - 1].spelling,
        'notion',
        'abstract',
        'antique',
      ];
      choices.shuffle();
      return choices;
    }
    var list = [];
    for (int i = 0; i < maxPage; i++) {
      if (currentPage == i + 1) continue;
      list.add(i + 1);
    }
    list.shuffle();

    var choices = [state[currentPage - 1].spelling];
    for (int i = 0; i < 3; i++) {
      choices.add(state[list[i] - 1].spelling);
    }

    return choices;
  }
}

final wordsListProvider =
    StateNotifierProvider<WordsListViewModel, List<Word>>((ref) {
  return WordsListViewModel(ref);
});

final wordsListFutureProvider = FutureProvider<List<Word>>((ref) async {
  final wordbookInfo =
      ref.watch(wordbookInfoProvider.notifier).getWordBookInfo();
  final ApiResult wordListResult =
      await getWordsData(wordbookInfo.dbID, wordbookInfo.apiKey);
  final List<Word> wordList = newWordsList(wordListResult.body!);

  return wordList;
});
