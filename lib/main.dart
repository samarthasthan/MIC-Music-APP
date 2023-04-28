import 'package:flutter/material.dart';
import 'package:mic_music_app/views/music_Screen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(ScreenUtilInit(
    minTextAdapt: true,
    splitScreenMode: true,
    designSize: const Size(375, 812),
    builder: (context, child) {
      return MaterialApp(
        theme: ThemeData.dark(),
        // ThemeData(
        //   //useMaterial3: true,
        //   colorScheme: ColorScheme.fromSeed(
        //     seedColor: Color.fromARGB(14, 11, 31, 47),
        //     primary: Color(0xFF0E0B1F),
        //     secondary: Color(0xFFCBFB5E),
        //   ),
        //   textTheme: GoogleFonts.robotoTextTheme(
        //     Theme.of(context).textTheme,
        //   ),
        // ),
        debugShowCheckedModeBanner: false,
        home: SwappablePages()
      );
    },
  ));
}
