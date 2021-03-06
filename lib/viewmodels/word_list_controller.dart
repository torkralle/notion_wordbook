// ๐ฆ Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/client/words/main.dart';
// ๐ Project imports:
import 'package:notion_wordbook/helper/words/new_list.dart';
import 'package:notion_wordbook/objects/models/notion_key.dart';
import 'package:notion_wordbook/objects/models/word.dart';
import 'package:notion_wordbook/viewmodels/wordbook_info.dart';

/// [WordsListViewModel]ใฎ[state]ใฏ้ธๆไธญใฎๅ่ชๅธณใฎไธญ่บซใ็ถๆใจใใฆๆใค
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

    // TODO: maxPageใ่ถใใใจใใฎๆๅใ่ใใ
    // TODO: ๅใๆๅญๅใฎๅ่ชใๅฅใฃใใจใใฎๆๅใ่ใใ
    if (currentPage > maxPage) return <String>['above', 'max', 'error', 'w'];

    /// ๅ่ชๅธณๅใฎๅ่ชใฎ็ทๆฐใ4ใคๆชๆบใ ใฃใใๆๅฎใฎๅ่ชใ้ธๆ่ขใจใใฆ่กจ็คบใใ
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

    /// ๅ่ชๅธณๅใฎๅ่ชใใไปใฎใใผใธใฎ็ญใใ้คใใฆใใทใฃใใใซใใ
    List<int> list = <int>[];
    for (int i = 0; i < maxPage; i++) {
      if (currentPage == i + 1) continue;
      list.add(i + 1);
    }
    list.shuffle();

    /// ใทใฃใใใซใใ้ๅใใๅ3ใคใๅใๅบใใฆใ็พๅจใฎ็ญใใฎๅ่ชใ่ฟฝๅ ใใ
    List<String> choices = <String>[state[currentPage - 1].spelling];
    for (int i = 0; i < 3; i++) {
      choices.add(state[list[i] - 1].spelling);
    }

    return choices;
  }

  void updateIsCorrect(int indexNumber, bool isCorrect) {
    final WordbookInfo wordbookInfo = ref.read(wordbookInfoProvider);

    List<Word> updatedState = <Word>[];
    for (int i = 0; i < state.length; i++) {
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
  final WordbookInfo wordbookInfo = ref.read(wordbookInfoProvider);
  final ApiResult wordListResult =
      await getWordsData(wordbookInfo.dbID, wordbookInfo.apiKey);
  final List<Word> wordList = newWordsList(wordListResult.body!);

  return wordList;
});


/// [previousCorrectCountProvider] ใฏๅๅใฎใในใใงๆญฃ่งฃใใๅ่ชใฎๆฐใ็ถๆใจใใฆๆใค
class PreviousCorrectCountNotifier extends StateNotifier<int> {
  PreviousCorrectCountNotifier() : super(0);

  void initState(WidgetRef ref) {
    final List<Word> wordList = ref.read(wordsListProvider);
    state = wordList.where((Word word) => word.correct == true).length;
  }
}

final StateNotifierProvider<PreviousCorrectCountNotifier, int>
    previousCorrectCountProvider =
    StateNotifierProvider<PreviousCorrectCountNotifier, int>(
  (StateNotifierProviderRef<PreviousCorrectCountNotifier, int> ref) =>
      PreviousCorrectCountNotifier(),
);
