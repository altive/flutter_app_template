import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 標準のライトテーマ
ThemeData get defaultLightTheme {
  const primaryColor = Color(0xFFF0BC1B);
  // const primaryLightColor = Color(0xFFffee57);
  const primaryDarkColor = Color(0xFFcc9900);
  const appBarBackgroundColor = Color(0xFFEEEAE1);
  const scaffoldBackgroundColor = Color(0xFFF6F3F0);

  return ThemeData.from(
    colorScheme: const ColorScheme.light().copyWith(
      primary: primaryColor,
      // primaryVariant: primaryDarkColor,
      secondary: primaryColor,
      // secondaryVariant: primaryLightColor,
      // Cardの背景色など
      // surface: ,
      // background: ,
      // error: ,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      // onSurface: ,
      // onBackground: ,
      // onError: ,
    ),
    textTheme: const TextTheme(
      button: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ).copyWith(
    primaryColorDark: primaryDarkColor,
    // TabBarの背景色に使用している。
    // AppBarと同じ色を指定するため
    bottomAppBarColor: appBarBackgroundColor,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      // AppBarの背景色
      color: appBarBackgroundColor,
      foregroundColor: Colors.black,
      elevation: 1,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: primaryDarkColor,
      unselectedLabelColor: Colors.black,
      labelStyle: TextStyle(fontWeight: FontWeight.normal),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 2,
    ),
    textButtonTheme: const TextButtonThemeData(),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
        side: MaterialStateProperty.all(
          const BorderSide(color: primaryColor),
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(44, 44),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
        elevation: MaterialStateProperty.all(0),
        minimumSize: MaterialStateProperty.all(
          const Size(44, 44),
        ),
      ),
    ),
    // IconButtonなど
    iconTheme: const IconThemeData(
      color: primaryColor,
    ),
    // TextFieldなど
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Color(0xFFE9E6E0),
    ),
    cupertinoOverrideTheme:
        const CupertinoThemeData(primaryContrastingColor: Colors.white),
    // RadioなどのActiveColor
    toggleableActiveColor: primaryColor,
  );
}
