import 'package:flutter/material.dart';

ThemeData appThemeLight = ThemeData(
  brightness: Brightness.light,
  backgroundColor: const Color(0xffF7F9FC),
  scaffoldBackgroundColor: Colors.white,
  hintColor: const Color(0xffC9CAD9),
  primaryColor: const Color(0xff25A244),
  primaryColorLight: const Color(0xffffffff),
  primaryColorDark: const Color(0xff000000),
  splashColor: const Color(0xff25A244).withOpacity(.40),
  textTheme: const TextTheme(),
  fontFamily: 'Poppins',
  highlightColor: const Color(0xffF72585),
  primaryTextTheme: TextTheme(
    headline1: const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
    headline2: const TextStyle(
        fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
    headline3: const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
    subtitle1: TextStyle(
        fontSize: 14,
        color: Colors.black.withOpacity(0.5),
        fontWeight: FontWeight.w600),
    subtitle2: TextStyle(
        fontSize: 14,
        color: Colors.black.withOpacity(0.5),
        fontWeight: FontWeight.normal),
  ),
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: const Color(0xffF72585)),
);

class DateTheme {
  static ThemeData datePickerTheme() {
    return ThemeData(
      splashColor: Colors.black,
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.black),
        button: TextStyle(color: Colors.black),
      ),
      dialogBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(
              primary: const Color(0xff25A244),
              onSecondary: Colors.black,
              onPrimary: Colors.white,
              surface: Colors.black,
              onSurface: Colors.black,
              secondary: Colors.black)
          .copyWith(primaryContainer: Colors.grey, secondary: Colors.black),
    );
  }



  static ThemeData timePickerTheme() {
    return ThemeData.light().copyWith(
      primaryColor:const Color(0xff25A244),
      highlightColor: const Color(0xffF72585),
      colorScheme: ColorScheme.light(
        primary: const Color(0xff25A244),
      ),
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
    );
  }


  
}

ThemeData datePickerTheme2() {
  return ThemeData(
    primarySwatch: Colors.grey,
    splashColor: Colors.black,
    textTheme: TextTheme(
      subtitle1: TextStyle(color: Colors.black),
      button: TextStyle(color: Colors.black),
    ),
    accentColor: Colors.black,
    colorScheme: ColorScheme.light(
        primary: Color(0xff119AE2),
        primaryVariant: Colors.black,
        secondaryVariant: Colors.black,
        onSecondary: Colors.black,
        onPrimary: Colors.white,
        surface: Colors.black,
        onSurface: Colors.black,
        secondary: Colors.black),
    dialogBackgroundColor: Colors.white,
  );
}
