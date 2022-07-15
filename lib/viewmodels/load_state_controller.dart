// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingStateViewModel extends StateNotifier<bool> {
  LoadingStateViewModel() : super(false);

  void update(bool s) => state = s;
}

final StateNotifierProvider<LoadingStateViewModel, bool> loadingStateProvider =
    StateNotifierProvider<LoadingStateViewModel, bool>(
        (StateNotifierProviderRef<LoadingStateViewModel, bool> ref) {
  return LoadingStateViewModel();
});
