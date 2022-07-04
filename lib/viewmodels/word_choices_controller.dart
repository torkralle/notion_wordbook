import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/viewmodels/word_list_controller.dart';

class WordChoicesViewModel extends StateNotifier<List<String>> {
  WordChoicesViewModel(this.ref) : super([]);
  Ref ref;

  setRandomChoices(int currentPage) {
    final wordChoices =
        ref.watch(wordsListProvider.notifier).getRandomWords(currentPage);
    wordChoices.shuffle();
    state = wordChoices;
  }
}

final wordChoicesProvider =
    StateNotifierProvider<WordChoicesViewModel, List<String>>((ref) {
  return WordChoicesViewModel(ref);
});
