import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:mic_music_app/views/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      'https://picsum.photos/200/300',
      'https://picsum.photos/250/350',
      'https://picsum.photos/300/400',
      'https://picsum.photos/350/450',
      'https://picsum.photos/400/500',
      'https://picsum.photos/450/550',
      'https://picsum.photos/500/600',
      'https://picsum.photos/550/650',
      'https://picsum.photos/600/700',
      'https://picsum.photos/650/750',
    ];
    return ScreenUtilInit(
      designSize: const Size(360, 690),
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
      child: HomePage(albums: imageUrls),
    );
  }
}
