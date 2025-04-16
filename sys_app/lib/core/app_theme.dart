import 'package:flutter/material.dart';

final Color darkPrimaryColor = Color(0xff121212); // Основной цвет фона
final Color darkAccentColor = Color(0xffbb86fc); // Акцентный цвет
final Color darkSecondaryColor = Color(
  0xff03dac6,
); // Вторичный цвет для кнопок и иконок

final darkAppTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: darkPrimaryColor,
    centerTitle: true,
    iconTheme: IconThemeData(color: darkAccentColor),
    titleTextStyle: TextStyle(color: darkAccentColor, fontSize: 20),
  ),
  brightness: Brightness.dark,
  primaryColor: darkPrimaryColor,
  colorScheme: ColorScheme.dark(
    primary: darkPrimaryColor,
    secondary: darkSecondaryColor,
    onPrimary: Colors.white, // Цвет текста на основном фоне
    onSecondary: Colors.black, // Цвет текста на вторичном фоне
  ),
  scaffoldBackgroundColor: darkPrimaryColor,
  progressIndicatorTheme: ProgressIndicatorThemeData(color: darkAccentColor),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: darkAccentColor,
    foregroundColor: Colors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: darkAccentColor),
    iconColor: darkSecondaryColor,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: darkAccentColor),
      borderRadius: BorderRadius.circular(8),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: darkSecondaryColor),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
  ),
);
