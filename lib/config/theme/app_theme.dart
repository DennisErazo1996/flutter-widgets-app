import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
  Color.fromARGB(255, 59, 95, 225)
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be between 0 and ${colorList.length - 1}');

  ThemeData getTheme() {
    final Color primaryColor = colorList[selectedColor];
    final ColorScheme colorScheme =
        ColorScheme.fromSeed(seedColor: primaryColor);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        //backgroundColor: primaryColor,
      ),
    );
  }
}
