import 'package:flutter/material.dart';

class MainTheme {
  MainTheme._();

  static const Color primary = Color(0xFF1A535C);
  static const Color turquoise = Color(0xFF4ECDC4);
  static const Color cream = Color(0xFFF7FFF7);
  static const Color yellow = Color(0xFFFFE66D);

  static final ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: cream,
        fontFamily: "Roboto",
        fontWeight: FontWeight.bold,
      ),
      color: primary,
      iconTheme: IconThemeData(color: yellow),
    ),
    colorScheme: const ColorScheme.light(
      primary: primary,
      secondary: yellow,
      onPrimary: cream,
    ),
    iconTheme: const IconThemeData(
      color: primary,
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.black12,
    ),
  );

  static ButtonStyle elevatedButtonStyle(BuildContext context) {
    return ButtonStyle(
      minimumSize: MaterialStateProperty.all(
        Size(
          MediaQuery.of(context).size.width * 1 / 2,
          MediaQuery.of(context).size.width * 1 / 10,
        ),
      ),
    );
  }
}
