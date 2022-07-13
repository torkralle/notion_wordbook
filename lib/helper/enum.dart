abstract class EnumHelper<T> {
  // 基本的には[enum.values()]に
  List<T> values();

  T valueOf(String value) {
    return values().firstWhere(
      (T item) {
      return name(item) == value;
    }, orElse: () => null as T,);
  }

  String? name(T enumValue) {
    // <型名>.<列挙子名>となるので、列挙子だけを取得
    return enumValue?.toString().split('.').last;
  }
}
