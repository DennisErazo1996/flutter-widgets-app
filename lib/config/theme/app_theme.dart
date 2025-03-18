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
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false
    })
      : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be between 0 and ${colorList.length - 1}');

  // ThemeData getTheme() {
  //   final Color primaryColor = colorList[selectedColor];
  //   final ColorScheme colorScheme = ColorScheme.fromSeed(seedColor: primaryColor);

  //   return ThemeData(
  //     useMaterial3: true,
  //     colorScheme: colorScheme,
  //     brightness: Brightness.dark,
  //     appBarTheme: const AppBarTheme(
  //       centerTitle: true,
  //       //backgroundColor: primaryColor,
  //     ),
  //   );
  // }
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )

  );

}
