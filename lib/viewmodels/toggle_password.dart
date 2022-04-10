// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ObscuritySwitchViewModel extends StateNotifier<bool> {
  ObscuritySwitchViewModel() : super(true);

  void switchVisibility() => state = !state;
}

final obscuritySwitchProvider =
    StateNotifierProvider<ObscuritySwitchViewModel, bool>((ref) {
  return ObscuritySwitchViewModel();
});
