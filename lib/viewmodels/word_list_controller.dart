// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/client/words/main.dart';
// 🌎 Project imports:
import 'package:notion_wordbook/helper/words/new_list.dart';
import 'package:notion_wordbook/objects/models/word.dart';
import 'package:notion_wordbook/viewmodels/wordbook_info.dart';

/// [WordsListViewModel]の[state]は選択中の単語帳の中身を状態として持つ
class WordsListViewModel extends StateNotifier<List<Word>> {
  WordsListViewModel(this.ref) : super(<Word>[]);
  Ref ref;

  Future<void> initState() async {
    final wordbookInfo = ref.read(wordbookInfoProvider);
    final result = await getWordsData(wordbookInfo.dbID, wordbookInfo.apiKey);
    state = newWordsList(result.body!);
  }

  List<String> getRandomWords(int currentPage) {
    final maxPage = state.length;

    // TODO: maxPageを超えたときの挙動を考える
    // TODO: 同じ文字列の単語が入ったときの挙動を考える
    if (currentPage > maxPage) {
      return <String>['above', 'max', 'error', 'w'];
    }

    /// 単語帳内の単語の総数が4つ未満だったら指定の単語を選択肢として表示する
    if (maxPage < 4) {
      final choices = <String>[
        state[currentPage - 1].spelling,
        'notion',
        'abstract',
        'antique',
      ];
      choices.shuffle();
      return choices;
    }

    /// 単語帳内の単語から今のページの答えを除いて、シャッフルする
    final list = <int>[];
    for (var i = 0; i < maxPage; i++) {
      if (currentPage == i + 1) {}
      list.add(i + 1);
    }
    list.shuffle();

    /// シャッフルした配列から前3つを取り出して、現在の答えの単語を追加する
    final choices = <String>[state[currentPage - 1].spelling];
    for (var i = 0; i < 3; i++) {
      choices.add(state[list[i] - 1].spelling);
    }

    return choices;
  }

  void updateIsCorrect(int indexNumber, bool isCorrect) {
    final wordbookInfo = ref.read(wordbookInfoProvider);

    final updatedState = <Word>[];
    for (var i = 0; i < state.length; i++) {
      if (i != indexNumber) {
        updatedState.add(state[i]);
      } else {
        updateWordIsCorrect(wordbookInfo.apiKey, state[i].pageId, isCorrect);
        updatedState.add(
          Word(
            state[i].pageId,
            state[i].spelling,
            isCorrect,
            state[i].meaning,
            state[i].tags,
            state[i].exampleSentence,
            state[i].link,
          ),
        );
      }
    }
    state = updatedState;
  }
}

final StateNotifierProvider<WordsListViewModel, List<Word>> wordsListProvider =
    StateNotifierProvider<WordsListViewModel, List<Word>>(
        (StateNotifierProviderRef<WordsListViewModel, List<Word>> ref) {
  return WordsListViewModel(ref);
});

final FutureProvider<List<Word>> wordsListFutureProvider =
    FutureProvider<List<Word>>((FutureProviderRef<List<Word>> ref) async {
  final wordbookInfo = ref.read(wordbookInfoProvider);
  final wordListResult =
      await getWordsData(wordbookInfo.dbID, wordbookInfo.apiKey);
  final wordList = newWordsList(wordListResult.body!);

  return wordList;
});

/// [previousCorrectCountProvider] は前回のテストで正解した単語の数を状態として持つ
class PreviousCorrectCountNotifier extends StateNotifier<int> {
  PreviousCorrectCountNotifier() : super(0);

  void initState(WidgetRef ref) {
    final wordList = ref.read(wordsListProvider);
    state = wordList.where((Word word) => word.correct == true).length;
  }
}

final StateNotifierProvider<PreviousCorrectCountNotifier, int>
    previousCorrectCountProvider =
    StateNotifierProvider<PreviousCorrectCountNotifier, int>(
  (StateNotifierProviderRef<PreviousCorrectCountNotifier, int> ref) =>
      PreviousCorrectCountNotifier(),
);
