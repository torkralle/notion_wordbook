// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/client/words/main.dart';
// 🌎 Project imports:
import 'package:notion_wordbook/helper/words/new_list.dart';
import 'package:notion_wordbook/objects/models/notion_key.dart';
import 'package:notion_wordbook/objects/models/word.dart';
import 'package:notion_wordbook/viewmodels/wordbook_info.dart';

class WordsListViewModel extends StateNotifier<List<Word>> {
  WordsListViewModel(this.ref) : super(<Word>[]);
  Ref ref;

  Future<void> initState() async {
    final WordbookInfo wordbookInfo = ref.read(wordbookInfoProvider);
    final ApiResult result =
        await getWordsData(wordbookInfo.dbID, wordbookInfo.apiKey);
    state = newWordsList(result.body!);
  }

  List<String> getRandomWords(int currentPage) {
    final int maxPage = state.length;

    /// TODO: maxPageを超えたときの挙動を考える
    if (currentPage >= maxPage) return <String>['above', 'max', 'error', 'w'];

    /// 単語帳内の単語の総数が4つ未満だったら指定の単語を選択肢として表示する
    if (maxPage < 4) {
      List<String> choices = <String>[
        state[currentPage - 1].spelling,
        'notion',
        'abstract',
        'antique',
      ];
      choices.shuffle();
      return choices;
    }

    /// 単語帳内の単語から今のページの答えを除いて、シャッフルする
    List<int> list = <int>[];
    for (int i = 0; i < maxPage; i++) {
      if (currentPage == i + 1) continue;
      list.add(i + 1);
    }
    list.shuffle();

    /// シャッフルした配列から前3つを取り出して、現在の答えの単語を追加する
    List<String> choices = <String>[state[currentPage - 1].spelling];
    for (int i = 0; i < 3; i++) {
      choices.add(state[list[i] - 1].spelling);
    }

    return choices;
  }
}

final StateNotifierProvider<WordsListViewModel, List<Word>> wordsListProvider =
    StateNotifierProvider<WordsListViewModel, List<Word>>(
        (StateNotifierProviderRef<WordsListViewModel, List<Word>> ref) {
  return WordsListViewModel(ref);
});

final FutureProvider<List<Word>> wordsListFutureProvider =
    FutureProvider<List<Word>>((FutureProviderRef<List<Word>> ref) async {
  final WordbookInfo wordbookInfo = ref.read(wordbookInfoProvider);
  final ApiResult wordListResult =
      await getWordsData(wordbookInfo.dbID, wordbookInfo.apiKey);
  final List<Word> wordList = newWordsList(wordListResult.body!);

  return wordList;
});
