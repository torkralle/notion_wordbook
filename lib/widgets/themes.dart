import 'package:flutter/material.dart';
import 'package:notion_wordbook/widgets/padding.dart';

ThemeData notionWordbookTheme = ThemeData(
  // AppBar などで使用する濃い紫
  primaryColor: notionPrimaryColor,
  // デフォルトのCardウィジェットのメインカラー
  cardColor: notionSurfaceColor,
  colorScheme: notionColorScheme,
  appBarTheme: notionAppBarTheme,
  textTheme: notionTextTheme,
  cardTheme: notionCardTheme,
);

const Color notionPrimaryColor = Color(0xFF6A1B9A);
const Color notionOnPrimaryColor = Color(0x00000000);
const Color notionSecondaryColor = Color.fromARGB(234, 250, 241, 252);
const Color notionOnSecondaryColor = notionPrimaryColor;
const Color notionErrorColor = Color.fromARGB(255, 255, 0, 0);
const Color notionOnErrorColor = Color(0x00000000);
const Color notionBackgroundColor = Color.fromARGB(80, 100, 100, 100);
const Color notionOnBackgroundColor = Color(0xFF6A1B9A);
const Color notionSurfaceColor = Color.fromARGB(255, 244, 235, 248);
const Color notionOnSurfaceColor = Color.fromARGB(141, 0, 0, 0);
const Brightness notionBrightness = Brightness.light;
const Color notionOutline = Color.fromARGB(255, 226, 226, 226);

const ColorScheme notionColorScheme = ColorScheme(
  brightness: notionBrightness,
  primary: notionPrimaryColor,
  onPrimary: notionOnPrimaryColor,
  secondary: notionSecondaryColor,
  onSecondary: notionOnSecondaryColor,
  error: notionErrorColor,
  onError: notionOnErrorColor,
  background: notionBackgroundColor,
  onBackground: notionOnBackgroundColor,
  surface: notionSurfaceColor,
  onSurface: notionOnSurfaceColor,
  outline: notionOutline,
);

CardTheme notionCardTheme = CardTheme(
  elevation: 2,
  color: notionSecondaryColor,
  margin: mainPadding,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
);

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
const AppBarTheme notionAppBarTheme = AppBarTheme(
  backgroundColor: notionPrimaryColor,
  centerTitle: true,
  toolbarHeight: 80,
  elevation: 16,
  titleTextStyle: TextStyle(fontSize: 24),
);
