import 'package:flutter/material.dart';
import 'package:notion_wordbook/widgets/padding.dart';
import 'package:notion_wordbook/widgets/themes/color_scheme.dart';

CardTheme notionCardTheme = CardTheme(
  elevation: 2,
  color: notionSecondaryColor,
  margin: mainPadding,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
);
