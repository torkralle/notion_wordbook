import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/viewmodels/word_list_controller.dart';

class WordChoicesViewModel extends StateNotifier<List<String>> {
  WordChoicesViewModel(this.ref) : super(<String>[]);
  Ref ref;

  void setRandomChoices(int currentPage) {
    final wordChoices =
        ref.read(wordsListProvider.notifier).getRandomWords(currentPage);
    wordChoices.shuffle();
    state = wordChoices;
  }
}

final StateNotifierProvider<WordChoicesViewModel, List<String>>
    wordChoicesProvider =
    StateNotifierProvider<WordChoicesViewModel, List<String>>(
        (StateNotifierProviderRef<WordChoicesViewModel, List<String>> ref) {
  return WordChoicesViewModel(ref);
});
