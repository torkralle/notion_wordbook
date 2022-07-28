// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/viewmodels/word_list_controller.dart';

class MaxPageNotifier extends StateNotifier<int> {
  MaxPageNotifier(this.ref) : super(1);
  Ref ref;

  void getListLength() {
    final wordList = ref.read(wordsListProvider);
    state = wordList.length;
  }
}

final StateNotifierProvider<MaxPageNotifier, int> maxPageProvider =
    StateNotifierProvider<MaxPageNotifier, int>(
        (StateNotifierProviderRef<MaxPageNotifier, int> ref) {
  return MaxPageNotifier(ref);
});

class CurrentPageNotifier extends StateNotifier<int> {
  CurrentPageNotifier() : super(1);

  void initState() => state = 1;

  void pageCount() => state++;
}

final StateNotifierProvider<CurrentPageNotifier, int> currentPageProvider =
    StateNotifierProvider<CurrentPageNotifier, int>(
        (StateNotifierProviderRef<CurrentPageNotifier, int> ref) {
  return CurrentPageNotifier();
});
