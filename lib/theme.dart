import 'package:flutter/material.dart';

class AppColours {
  static Color primaryColor = const Color.fromRGBO(162, 29, 19, 1);
  static Color primaryAccent = const Color.fromRGBO(120, 14, 14, 1);
  static Color secondaryColor = const Color.fromRGBO(45, 45, 45, 1);
  static Color secondaryAccent = const Color.fromRGBO(35, 35, 35, 1);
  static Color titleColor = const Color.fromRGBO(200, 200, 200, 1);
  static Color textColor = const Color.fromRGBO(150, 150, 150, 1);
  static Color successColor = const Color.fromRGBO(9, 149, 110, 1);
  static Color highlightColor = const Color.fromRGBO(212, 172, 13, 1);
}

ThemeData primaryTheme = ThemeData(
  // seed
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColours.primaryColor,
  ),

  // Scaffold Colour
  scaffoldBackgroundColor: AppColours.secondaryAccent,

  // AppBar theme colours
  appBarTheme: AppBarTheme(
    backgroundColor: AppColours.secondaryColor,
    foregroundColor: AppColours.textColor,
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
  ),

  // Text Theme
  textTheme: const TextTheme().copyWith(
    bodyMedium: TextStyle(
      color: AppColours.textColor,
      fontSize: 16,
      letterSpacing: 1,
    ),
    headlineMedium: TextStyle(
      color: AppColours.titleColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
    titleMedium: TextStyle(
      color: AppColours.titleColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    ),
  ),

  // Card Theme
  cardTheme: CardTheme(
    color: AppColours.secondaryColor.withOpacity(0.6),
    shape: const RoundedRectangleBorder(),
    shadowColor: Colors.transparent,
    margin: const EdgeInsets.only(bottom: 16),
  ),

  // Input Decoration Theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColours.secondaryColor.withOpacity(0.6),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8),
    ),
    labelStyle: TextStyle(
      color: AppColours.textColor,
      // fontSize: 16,
      // letterSpacing: 1,
    ),
    iconColor: AppColours.textColor,
    prefixIconColor: AppColours.textColor,
  ),

  dialogTheme: DialogTheme(
    backgroundColor: AppColours.secondaryColor,
  ),
);
