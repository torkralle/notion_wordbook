import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<ResultListMode> resultListModeProvider =
    StateProvider<ResultListMode>((StateProviderRef<ResultListMode> ref) {
  return ResultListMode.all;
});

enum ResultListMode {
  correct,
  incorrect,
  all,
}
