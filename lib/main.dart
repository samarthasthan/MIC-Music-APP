import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:micmusic/views/Accounts.dart';
import 'package:micmusic/views/Album.dart';
import 'package:micmusic/views/Artist.dart';
import 'package:micmusic/views/Edit.dart';
import 'package:micmusic/views/Playlist.dart';
import 'package:micmusic/views/Settings.dart';
import 'package:micmusic/views/Song.dart';

import 'package:mic_music_app/views/homePageView.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MIC Music App',
          theme: ThemeData(
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
             colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(14, 11, 31, 47),
              primary: Color(0xFF0E0B1F),
              secondary: Color(0xFFCBFB5E),
            ),
            useMaterial3: true,
          ),
          home: child,
          initialRoute: '/',
          routes: {
            '/': (context) =>  Account(),
            '/settings':(context)  => const Settings(),
            '/edit' : (context) => const Edit(),
            '/accounts/album' : (context) => Album(),
            '/accounts/playlist' : (context) => const Playlist(),
            '/accounts/songs' : (context) => const Song(),
            '/accounts/artists' : (context) => const Artist(),
          },
        );
      },
      child: HomePageView(),

    );
  }
}
