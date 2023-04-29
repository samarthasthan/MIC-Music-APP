import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:micmusic/models/RadioModel.dart';

class RadioPlay extends StatefulWidget {
  const RadioPlay({super.key});

  @override
  State<RadioPlay> createState() => _RadioPlayState();
}

class _RadioPlayState extends State<RadioPlay> {
  int _index = 0;
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as RadioPlayArgs;
    return Stack(children: [
      PageView(
        controller: pageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: (_) {
            setState(() {
              _index = _;
            });
          },
          children: [
            Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color(0xFF0E0B1F),
                  elevation: 0.0,
                ),
                backgroundColor: const Color(0xFF0E0B1F),
                body: Body(
                  title: args.title,
                  subTitle: args.subTitle,
                  imagePath: args.imagePath,
                  duration: args.duration,
                )),
            Scaffold(
                body: RadioDetails(
              title: args.title,
              subtitle: args.subTitle,
              backgroundImagePath: args.backGroundImagePath,
              description: args.description,
              program: args.program,
              schedule: args.schedule,
              producer: args.producer,
              category: args.category,
            ))
          ]),
      Positioned(
        top: 124.h,
        left: 165.w,
        child: SizedBox(
          width: 44.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => pageController.animateToPage(0, duration: const Duration(microseconds: 500), curve: Curves.easeInOut),
                child: Container(
                  width: 20.w,
                  height: 3.h,
                  decoration: BoxDecoration(
                      color:
                          (_index == 0) ? Colors.white : const Color(0xFF71737B),
                      borderRadius: BorderRadius.circular(3.5.r)),
                ),
              ),
              GestureDetector(
                onTap: () => pageController.animateToPage(0, duration: const Duration(microseconds: 500), curve: Curves.easeInOut),
                child: Container(
                  width: 20.w,
                  height: 3.h,
                  decoration: BoxDecoration(
                      color:
                          (_index == 1) ? Colors.white : const Color(0xFF71737B),
                      borderRadius: BorderRadius.circular(3.5.r)),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}

class Body extends StatefulWidget {
  String title;
  String subTitle;
  String imagePath;
  Duration duration;
  Body(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.imagePath,
      required this.duration});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double _position = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 93.sp,
                  ),
                  Image.asset(
                    widget.imagePath,
                    height: 207.h,
                    width: 207.h,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    widget.title,
                    style: GoogleFonts.roboto(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFEEEEEE),
                    ),
                  ),
                  Text(
                    widget.subTitle,
                    style: GoogleFonts.roboto(
                        fontSize: 18.sp,
                        color: const Color(0xFFEEEEEE),
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              SliderTheme(
                data: const SliderThemeData(
                    valueIndicatorColor: Color(0xFFCBFB5E),
                    thumbColor: Color(0xFF20242F),
                    overlayColor: Color(0xFFCBFB5E)),
                child: Slider(
                    inactiveColor: const Color(0xFFBDB9B9),
                    activeColor: const Color(0xFFCBFB5E),
                    min: 0,
                    max: 100,
                    value: _position,
                    onChanged: (val) {
                      setState(() {
                        _position = val;
                      });
                    }),
              ),
              Controller(
                duration: widget.duration,
                position: _position,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Controller extends StatefulWidget {
  Duration duration;
  double position;
  Controller({super.key, required this.duration, required this.position});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  late double _position;
  late Duration duration;

  @override
  void initState() {
    duration = widget.duration;
    _position = widget.position;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 329.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            //width: 329.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${Duration(seconds: widget.position * duration.inSeconds ~/ 100).inMinutes}:${(widget.position * duration.inSeconds ~/ 100 % 60) < 10 ? ("0${widget.position * duration.inSeconds ~/ 100 % 60}") : ((widget.position * duration.inSeconds ~/ 100 % 60))}",
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  "${duration.inMinutes}:${(duration.inSeconds.toInt() % 60) < 10 ? ("0${duration.inSeconds.toInt() % 60}") : (duration.inSeconds.toInt() % 60)}",
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
          SizedBox(
            height: 73.h,
            width: 200.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.skip_previous_outlined,
                    size: 30.h,
                    color: Color(0xFFEEEEEE),
                  ),
                  onPressed: () {},
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: 73.h,
                      height: 73.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFCBFB5E),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFA9A9A9).withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 3,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.play_arrow_outlined,
                        color: const Color(0xFF20242F),
                        size: 50.h,
                      )),
                ),
                IconButton(
                  icon: Icon(
                    Icons.skip_next_outlined,
                    size: 30.h,
                    color: const Color(0xFFEEEEEE),
                  ),
                  onPressed: () {
                    //handle on press
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RadioDetails extends StatelessWidget {
  String title;
  String subtitle;
  String backgroundImagePath;
  String description;
  String program;
  String schedule;
  String producer;
  String category;
  RadioDetails(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.backgroundImagePath,
      required this.description,
      required this.program,
      required this.schedule,
      required this.producer,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25.h,
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back,
                    size: 24.h, color: const Color(0xFFEEEEEE))),
            SizedBox(
              height: 80.h,
            ),
            Container(
              width: 355.w,
              child: DetailsControllers(),
              alignment: Alignment.center,
            ),
            SizedBox(height: 130.h),
            Text(
              title,
              style: GoogleFonts.roboto(
                  color: const Color(0xFFEEEEEE),
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle,
              style: GoogleFonts.roboto(
                color: const Color(0xFFEEEEEE),
                fontSize: 18.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            SizedBox(
              width: 287.w,
              child: Text(description,
                  style: GoogleFonts.roboto(
                      color: Color(0xFFEEEEEE),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal)),
            ),
            SizedBox(
              height: 48.h,
            ),
            SizedBox(
                width: 183.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Program",
                          style: GoogleFonts.roboto(
                              color: const Color(0xFFEEEEEE),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "Schedule",
                          style: GoogleFonts.roboto(
                              color: const Color(0xFFEEEEEE),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "Producer",
                          style: GoogleFonts.roboto(
                              color: const Color(0xFFEEEEEE),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "Category",
                          style: GoogleFonts.roboto(
                              color: const Color(0xFFEEEEEE),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          program,
                          style: GoogleFonts.roboto(
                              color: const Color(0xFFEEEEEE),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          schedule,
                          style: GoogleFonts.roboto(
                              color: const Color(0xFFEEEEEE),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          producer,
                          style: GoogleFonts.roboto(
                              color: const Color(0xFFEEEEEE),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          category,
                          style: GoogleFonts.roboto(
                              color: const Color(0xFFEEEEEE),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class DetailsControllers extends StatelessWidget {
  const DetailsControllers({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      height: 73.h,
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.skip_previous_outlined,
                size: 24.h,
                color: Colors.white,
              )),
          GestureDetector(
            child: Icon(Icons.play_circle_outline,
                size: 73.h, color: Colors.white),
            onTap: () {},
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.skip_next_outlined,
                size: 24.h,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
