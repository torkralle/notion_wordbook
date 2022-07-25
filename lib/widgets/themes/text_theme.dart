import 'package:flutter/material.dart';
import 'package:notion_wordbook/widgets/themes/color_scheme.dart';

const TextTheme notionTextTheme = TextTheme(
  displayLarge: notionDisplayLarge,
  displayMedium: notionDisplayMedium,
  displaySmall: notionCaption,
  titleLarge: notionTitleLarge,
  titleMedium: notionTitleMedium,
  headlineLarge: notionHeadlineLarge,
);

// カードのタイトルとかに使ってる
const TextStyle notionTitleMedium = TextStyle(
  fontSize: 19,
  height: 1.6,
  color: notionOnSecondaryColor,
  fontWeight: FontWeight.bold,
);
// カードの説明欄とかに使ってる
const TextStyle notionCaption = TextStyle(
  fontSize: 14,
);
// アラートのタイトルとかに使ってる
const TextStyle notionTitleLarge = TextStyle(
  fontSize: 20,
  color: notionPrimaryColor,
);
// テスト結果画面のタイトルとかに使ってる
const TextStyle notionDisplayLarge = TextStyle(
  fontSize: 24,
  color: notionOnSurfaceColor,
);
const TextStyle notionDisplayMedium = TextStyle(
  fontSize: 20,
  color: notionOnSurfaceColor,
);
const TextStyle notionHeadlineLarge = TextStyle(
  fontSize: 60,
  color: notionOnSurfaceColor,
);
