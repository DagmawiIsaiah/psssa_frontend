import 'package:flutter/material.dart';

import '../utils/utils.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 24,
      fontVariations: const [
        FontVariation("wght", 800),
      ],
      fontFamily: "Montserrat",
      color: black,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontVariations: const [
        FontVariation("wght", 800),
      ],
      fontFamily: "Montserrat",
      color: black,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontVariations: const [
        FontVariation("wght", 600),
      ],
      fontFamily: "Montserrat",
      color: black,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: "Roboto",
      color: grey,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: "Roboto",
      color: grey,
    ),
    labelLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontFamily: "Roboto",
      color: black,
    ),
  );

  static const TextTheme darkTextTheme = TextTheme();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: background,
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: lightTextTheme,
    cardTheme: CardTheme(
      elevation: 5,
      color: white,
      shadowColor: shadowColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        shadowColor: primary,
        backgroundColor: primary,
        foregroundColor: white,
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontFamily: "Roboto",
          color: black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: black,
        side: BorderSide(
          color: black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontFamily: "Roboto",
          color: black,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primary,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: "Roboto",
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    textTheme: darkTextTheme,
  );
}
