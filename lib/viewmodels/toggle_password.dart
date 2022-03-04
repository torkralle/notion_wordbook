// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VisiblitySwitchViewModel extends StateNotifier<bool> {
  VisiblitySwitchViewModel() : super(true);

  void switchVisiblity() => state = !state;
}

final visiblitySwitchProvider =
    StateNotifierProvider<VisiblitySwitchViewModel, bool>((ref) {
  return VisiblitySwitchViewModel();
});
