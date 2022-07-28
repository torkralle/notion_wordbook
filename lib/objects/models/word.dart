// 🌎 Project imports:
// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:notion_wordbook/objects/enums/word_tag.dart';

@immutable
class Word {
  const Word(
    this.pageId,
    this.spelling,
    this.correct,
    this.meaning,
    this.tags,
    this.exampleSentence,
    this.link, 
  );
  final String pageId;
  final String spelling;
  final String? meaning;
  final String? exampleSentence;
  final String? link;
  // 正誤判定はAPIのJSON構造から必ず存在する
  final bool correct;
  final List<WordTag>? tags;
}
