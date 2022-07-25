import 'package:flutter/material.dart';

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
