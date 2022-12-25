import 'package:blackpad/global/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData themeData = ThemeData(
    primaryColor: MyColors.prime,
    fontFamily: GoogleFonts.outfit().fontFamily,
    scaffoldBackgroundColor: MyColors.white,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: MyColors.white,
      titleTextStyle: GoogleFonts.outfit(
        fontSize: 24,
        color: MyColors.prime,
      ),
      titleSpacing: 0,
      iconTheme: const IconThemeData(
        color: MyColors.prime,
      ),
    ),
  );
}
