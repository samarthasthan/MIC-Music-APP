import 'package:flutter/material.dart';
import 'package:mic_geezo_explore/views/Explore.dart';


void main() {
 runApp(const MaterialApp(
   home: MyApp(),
 ));
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  Explore createState() => Explore();

}




