import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    primarySwatch: Colors.indigo,
    fontFamily: 'Nunito',
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      foregroundColor: Colors.black,
      actionsIconTheme: IconThemeData(color: Colors.black),
    ),
  );
  static Color kPrimaryColor = const Color(0xffFF6B38);
  static Color kGreyColor = const Color(0xffFAFAFA);
  static Color kBlackColor = const Color(0xff32334D);
  static Color kPurpleColor = const Color(0xff8535F7);
}
