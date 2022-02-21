import 'package:json_annotation/json_annotation.dart';

part 'word.g.dart';

//キャメルケースを、Jsonでスネークケースに変換
@JsonSerializable(fieldRename: FieldRename.snake)
class Word {
  String spelling;
  String meaning;
  String link;
  bool correct;

  Word({required this.spelling});

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  Map<String, dynamic> toJson() => _$WordToJson(this);
}
