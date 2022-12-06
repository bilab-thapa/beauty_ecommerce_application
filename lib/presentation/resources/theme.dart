import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_manager.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.kTextColor,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: ColorManager.kPrimaryColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: GoogleFonts.poppins(color: ColorManager.kTextColor),
    bodyText2: GoogleFonts.poppins(color: ColorManager.kSecondaryTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: ColorManager.kPrimaryColor,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    toolbarTextStyle: const TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ).bodyText2,
    titleTextStyle: const TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ).headline6,
  );
}
