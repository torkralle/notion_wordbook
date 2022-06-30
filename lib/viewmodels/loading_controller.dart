import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoadingNotifier extends StateNotifier<bool> {
  LoadingNotifier() : super(false);

  void start() {
    state = true;
  }

  void stop() {
    state = false;
  }
}

final loadingNotifierProvider =
    StateNotifierProvider<LoadingNotifier, bool>((ref) {
  return LoadingNotifier();
});
