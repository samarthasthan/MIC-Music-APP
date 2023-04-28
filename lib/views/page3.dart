import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class Page3 extends StatefulWidget {
  const Page3({
    super.key,
  });

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Container(
            decoration: BoxDecoration(
              image:
                DecorationImage(
                image: AssetImage("assets/bg2.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top: 166,
              left: 166,
              child: Text(
                "Lyrics",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              )),
          Positioned(
            top: 222,
            left: 60,
            right: 60,
            child: SingleChildScrollView(
              child: Container(
                  child: Column(
                    children: [
                      Text(
                        "Lorem Ipsum is simply dummy text of the ",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Text(
                        "Lorem Ipsum is simply dummy text of the ",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Text(
                        "Lorem Ipsum is simply dummy text of the ",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Text(
                        "Lorem Ipsum is simply dummy text of the ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )),
            ),
          ),
          Positioned(top: 610,left:40,right: 40,
            child: Container(
                width: 300.sp,
                child: ProgressBar(
                    timeLabelPadding: 10,
                    barHeight: 3,
                    thumbRadius: 6,
                    thumbGlowRadius: 8,
                    progressBarColor: Color(0xFFCBFB5E),
                    baseBarColor: Colors.grey,
                    thumbColor: Color(0xFFCBFB5E),
                    progress: Duration(),
                    total: Duration(minutes: 5))),
          ),
          Positioned(top: 645,left: 23,right: 23, child:
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              IconButton(
                  onPressed: () {},
                  icon:
                  Icon(Icons.shuffle, color: Colors.white, size: 30)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.skip_previous_outlined,
                      color: Colors.white, size: 35)),
              TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.pause_circle_filled_outlined,
                    color: Color(0xFFCBFB5E),
                    size: 75,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.skip_next_outlined,
                      color: Colors.white, size: 35)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.loop, color: Colors.white, size: 35)),
            ],
          ))
        ],
      ),
    );
  }
}