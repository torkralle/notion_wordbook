import 'package:flutter/material.dart';
import 'package:notion_wordbook/widgets/appbar_theme.dart';
import 'package:notion_wordbook/widgets/themes/card_theme.dart';
import 'package:notion_wordbook/widgets/themes/color_scheme.dart';
import 'package:notion_wordbook/widgets/themes/text_theme.dart';

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
