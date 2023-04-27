import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:mic_music_app/views/homePageView.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(14, 11, 31, 47),
              primary: Color(0xFF0E0B1F),
              secondary: Color(0xFFCBFB5E),
            ),
            textTheme: GoogleFonts.robotoTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          
          home: child,
        );
      },
      
      child: HomePageView(),
    );
  }
}
