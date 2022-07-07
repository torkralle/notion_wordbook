import 'package:flutter/material.dart';

ThemeData notionWordbookTheme = ThemeData(
  // AppBar などで使用する濃い紫
  primaryColor: mainPurple,
  appBarTheme: mainAppBarTheme,
);

const Color mainPurple = Color(0xFF6A1B9A);
const AppBarTheme mainAppBarTheme = AppBarTheme(
  centerTitle: true,
  toolbarHeight: 80,
  elevation: 10,
  titleTextStyle: TextStyle(fontSize: 27),
);
