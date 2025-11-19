import 'package:flutter/material.dart';

class AppTheme {
  //
  static const mainColor = Colors.blueGrey;
  static const displayColor = Color.fromARGB(255, 0, 255, 0);
  static const displayBorderColor = Colors.white;
  static const buttonBorderColor = Colors.grey;
  static const clearButtonColor = Colors.red;
  static const operatorButtonColor = Colors.yellow;
  static const totalButtonColor = Color.fromARGB(255, 0, 255, 0);
  static const decimalSeparatorButtonColor = Colors.orange;
  static const defaultButtonColor = Colors.white;

  static ThemeData buildTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: mainColor,
        brightness: Brightness.dark,
      ),
    );
  }
}
