import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 標準のダークテーマ
ThemeData get defaultDarkTheme {
  const primaryColor = Color(0xFFb98c00);
  const primaryDarkColor = Color(0xFFb98c00);
  const appBarBackgroundColor = Color(0xFF333333);

  return ThemeData.from(
    colorScheme: const ColorScheme.dark().copyWith(
      primary: primaryColor,
      // primaryVariant: primaryDarkColor,
      secondary: primaryColor,
      // secondaryVariant: primaryLightColor,
      // Cardの背景色など
      surface: Colors.grey[900],
      // background: ,
      // error: ,
      onPrimary: Colors.black,
      // onSecondary: ,
      // onSurface: ,
      // onBackground: ,
      // onError: ,
    ),
    textTheme: const TextTheme(
      button: TextStyle(fontWeight: FontWeight.bold),
    ),
  ).copyWith(
    primaryColorDark: primaryDarkColor,
    bottomAppBarColor: appBarBackgroundColor,
    // scaffoldBackgroundColor: Colors.grey[100],
    appBarTheme: const AppBarTheme(
      // AppBarの色
      color: appBarBackgroundColor,
      foregroundColor: Colors.white,
      elevation: 1,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: primaryDarkColor,
      unselectedLabelColor: Colors.white,
      labelStyle: TextStyle(fontWeight: FontWeight.normal),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
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
      fillColor: appBarBackgroundColor,
    ),
    // RadioなどのActiveColor
    toggleableActiveColor: primaryColor,
    // ダイアログ内のTextFieldColorがBlackで視認できない問題のWorkaround
    cupertinoOverrideTheme: const CupertinoThemeData(
      textTheme: CupertinoTextThemeData(),
    ),
  );
}
