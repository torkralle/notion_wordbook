// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingStateViewModel extends StateNotifier<bool> {
  LoadingStateViewModel() : super(false);

  void update(bool s) => state = s;
}

final loadingStateProvider =
    StateNotifierProvider<LoadingStateViewModel, bool>((ref) {
  return LoadingStateViewModel();
});
