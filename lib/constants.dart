import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:google_fonts/google_fonts.dart';

Color backGroundColor = Color(0xFF0E0B1F);

Color iconColor = const Color(0xFFEEEEEE);

TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.roboto(
        fontSize: 48.sp, fontWeight: FontWeight.bold, color: Colors.white),
    headlineLarge: GoogleFonts.roboto(
        fontSize: 16.sp, fontWeight: FontWeight.bold, color: Color(0xFFEEEEEE)),
    headlineMedium: GoogleFonts.roboto(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: Color(0xFFEEEEEE)),
    displayMedium: GoogleFonts.roboto(
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
      color: Color(0xFFEEEEEE),
    ),
    bodyLarge: GoogleFonts.roboto(
      fontSize: 16.sp,
      color: Color(0xFFEEEEEE),
      fontWeight: FontWeight.normal,
    ),
    displaySmall: GoogleFonts.roboto(
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
      color: Color(0xFFEEEEEE),
    ),
    bodyMedium: GoogleFonts.quicksand(
        fontSize: 10.sp,
        fontWeight: FontWeight.bold,
        color: Color(0xFF71737B)),
    bodySmall: GoogleFonts.roboto(
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
      color: Color(0xFF71737B)
    ),
    headlineSmall: GoogleFonts.roboto(
      fontSize: 14.sp,
      color: Color(0xFFCBFB5E),
      fontWeight: FontWeight.normal,
    )
    
        );
