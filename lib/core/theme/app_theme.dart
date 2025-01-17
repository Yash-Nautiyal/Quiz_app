import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    ),
  );
}
