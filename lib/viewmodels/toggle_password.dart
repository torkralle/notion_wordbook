// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ObscuritySwitchViewModel extends StateNotifier<bool> {
  ObscuritySwitchViewModel() : super(true);

  void switchVisibility() => state = !state;
}

final StateNotifierProvider<ObscuritySwitchViewModel, bool>
    obscuritySwitchProvider =
    StateNotifierProvider<ObscuritySwitchViewModel, bool>(
        (StateNotifierProviderRef<ObscuritySwitchViewModel, bool> ref) {
  return ObscuritySwitchViewModel();
});
