import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const brand2 = Color(0xFF0E0B1F);
const brand1 = Color(0xFFCBFB5E);
const neutral1 = Color(0xFFEEEEEE);
const neutral2 = Color(0xFF71737B);
const neutral3 = Color(0xFF20242F);
const border = Color(0xFF3E3C4C);

class Constants {
  static TextStyle title = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 48.sp,
    fontWeight: FontWeight.bold,
    color: neutral1,
  );

  static TextStyle subtitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    color: neutral1,
  );

  static TextStyle sub = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: neutral1,
  );

  static TextStyle musicTitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: neutral1,
  );

  static TextStyle musicSubTitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12.sp,
    color: neutral1,
  );
  static TextStyle head = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: neutral1,
  );
  static TextStyle subHead = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: neutral1,
  );
  static TextStyle extra = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: neutral1,
  );
}

class TextStyles {
  static TextStyle title = GoogleFonts.roboto(
    textStyle: Constants.title,
  );

  static TextStyle subtitle = GoogleFonts.roboto(
    textStyle: Constants.subtitle,
  );

  static TextStyle sub = GoogleFonts.roboto(
    textStyle: Constants.sub,
  );
  static TextStyle musicTilte = GoogleFonts.roboto(
    textStyle: Constants.musicTitle,
  );
  static TextStyle musicSubTitle = GoogleFonts.roboto(
    textStyle: Constants.musicSubTitle,
  );
  static TextStyle head = GoogleFonts.roboto(
    textStyle: Constants.head,
  );
  static TextStyle subHead = GoogleFonts.roboto(
    textStyle: Constants.subHead,
  );
  static TextStyle extra = GoogleFonts.roboto(
    textStyle: Constants.extra,
  );
}
