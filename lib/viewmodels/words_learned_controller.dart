import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WordsLearnedNotifier extends StateNotifier<int> {
  WordsLearnedNotifier() : super(0);

  Future<void> loadState() async {
    final today =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getInt('wordsLearned$today') ?? 0;
  }

  Future<void> update(int numberOfWordsLearned) async {
    final today =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    // まず状態を今日の日付のものにする。
    await loadState();

    final prefs = await SharedPreferences.getInstance();
    state += numberOfWordsLearned;
    await prefs.setInt(
      'wordsLearned$today',
      state,
    );
  }
}

final StateNotifierProvider<WordsLearnedNotifier, int> wordsLearnedProvider =
    StateNotifierProvider<WordsLearnedNotifier, int>(
        (StateNotifierProviderRef<WordsLearnedNotifier, int> ref) {
  return WordsLearnedNotifier();
});
