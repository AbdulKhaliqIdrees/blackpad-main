import 'package:blackpad/global/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: MyColors.prime,
        behavior: SnackBarBehavior.floating,
        content: Text(
          text,
          style: GoogleFonts.outfit(
            fontSize: 20,
            color: MyColors.white,
          ),
        ),
      ),
    );
}
