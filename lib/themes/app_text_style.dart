import 'package:e_book_app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle headerWhite = GoogleFonts.openSans(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static TextStyle inputWhite = GoogleFonts.openSans(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textWhite = GoogleFonts.openSans(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static TextStyle buttonWhite = GoogleFonts.openSans(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static TextStyle labelWhite = GoogleFonts.openSans(
    color: Colors.white,
    fontSize: 10,
    fontWeight: FontWeight.bold,
  );

  static TextStyle buttonOrange = GoogleFonts.openSans(
    color: AppColors.deepOrange,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textBlue = GoogleFonts.openSans(
    color: AppColors.darkBlue,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
}
