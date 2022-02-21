// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Word _$WordFromJson(Map<String, dynamic> json) => Word(
      spelling: json['spelling'] as String,
    )
      ..meaning = json['meaning'] as String
      ..link = json['link'] as String
      ..correct = json['correct'] as bool;

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
      'spelling': instance.spelling,
      'meaning': instance.meaning,
      'link': instance.link,
      'correct': instance.correct,
    };
