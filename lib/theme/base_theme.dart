import 'package:flutter/material.dart';

ThemeData renderBaseTheme(BuildContext context) {
  var defaultColor = const Color.fromRGBO(30, 45, 67, 1);
  return ThemeData(
      filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(defaultColor),
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
      )),
      inputDecorationTheme: InputDecorationTheme(
          floatingLabelAlignment: FloatingLabelAlignment.start,
          alignLabelWithHint: true,
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: defaultColor,
          ))),
      useMaterial3: true);
}
