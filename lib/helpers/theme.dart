import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(primary: kPrimaryColor),
    appBarTheme: appBarTheme(),
    textTheme: GoogleFonts.poppinsTextTheme(), // Ganti di sini
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(17),
    borderSide: BorderSide(color: Colors.grey[300]!),
    gapPadding: 10,
  );
  OutlineInputBorder outlineInputFocusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(17),
    borderSide: BorderSide(color: Colors.grey[500]!, width: 1.4),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputFocusBorder,
    border: outlineInputBorder,
    hintStyle: TextStyle(color: Colors.grey),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyLarge: TextStyle(color: kTextColor),
    bodyMedium: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Color(0xFF8B8B8B),
      fontSize: 18,
      fontWeight: FontWeight
          .w500, // tambahkan fontWeight jika ingin tampak seperti default headline6
    ),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  );
}
