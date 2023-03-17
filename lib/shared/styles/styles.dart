import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woman_drive/shared/styles/colors.dart';

abstract class AppTextStyles {
  /// - weight: w200
  /// - family: cairo
  static TextStyle boldtitles = GoogleFonts.tajawal(
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );

  /// - weight: w300
  /// - family: cairo
  static const TextStyle w300 =
      TextStyle(fontWeight: FontWeight.w300, fontSize: 30);

  /// - weight: w400
  /// - family: cairo
  static TextStyle w400 =
      GoogleFonts.tajawal(fontWeight: FontWeight.w400, fontSize: 18);
  static TextStyle w400s =
      GoogleFonts.tajawal(fontWeight: FontWeight.w400, fontSize: 14);

  /// - weight: w500
  /// - family: cairo
  static TextStyle smTitles =
      GoogleFonts.tajawal(fontWeight: FontWeight.w500, fontSize: 20);

  /// - weight: w600
  /// - family: cairo
  static const TextStyle w600 = TextStyle(fontWeight: FontWeight.w600);

  /// - weight: w700
  /// - family: cairo
  static const TextStyle lrTitles =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 30);

  /// - weight: w800
  /// - family: cairo
  static TextStyle w800 =
      GoogleFonts.tajawal(fontWeight: FontWeight.w800, fontSize: 18);

  /// - weight: w900
  /// - family: cairo
  static const TextStyle w900 = TextStyle(fontWeight: FontWeight.w900);

  static TextStyle button = GoogleFonts.tajawal(
      fontSize: 22
      , color: AppColors.white, fontWeight: FontWeight.w600);

  static TextStyle name = GoogleFonts.tajawal(
      fontSize: 18, color: AppColors.black, fontWeight: FontWeight.w600);

  static TextStyle brButton = GoogleFonts.tajawal(
      fontSize: 20, color: AppColors.white, fontWeight: FontWeight.w600);

  static TextStyle sName = GoogleFonts.tajawal(
      fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w600);
}
