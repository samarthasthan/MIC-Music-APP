import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: Color.fromARGB(255, 27, 26, 52),
        appBar: AppBar(
          automaticallyImplyLeading: false,
//        backgroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const Center(
          child: Text("HOMEPAGE"),
        ));
  }
}
