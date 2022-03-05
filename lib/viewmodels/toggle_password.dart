// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ObscuritylitySwitchViewModel extends StateNotifier<bool> {
  ObscuritylitySwitchViewModel() : super(true);

  void switchVisiblity() => state = !state;
}

final visiblitySwitchProvider =
    StateNotifierProvider<ObscuritylitySwitchViewModel, bool>((ref) {
  return ObscuritylitySwitchViewModel();
});
