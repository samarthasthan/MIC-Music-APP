import 'package:flutter/material.dart';
import 'package:micmusic/views/loginPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:micmusic/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController(initialPage: 0);
  TextStyle title = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 48.sp,
    fontWeight: FontWeight.bold,
    color: neutral1,
  );
  TextStyle sub = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: neutral1,
  );
  TextStyle subHead = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: neutral1,
  );
  TextStyle extra = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: neutral1,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          child: PageView.builder(
              controller: _controller,
              itemCount: 3,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Scaffold(
                    body: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/1.png"),
                            colorFilter: ColorFilter.mode(
                                Colors.black54, BlendMode.luminosity),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: null /* add child content here */,
                      ),
                      Center(
                          child: Text(
                        'GEEZ',
                        style: title,
                      ))
                    ]),
                  );
                } else if (index == 1) {
                  return Scaffold(
                    body: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/2.png"),
                              colorFilter: ColorFilter.mode(
                                  Colors.black54, BlendMode.luminosity),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: null /* add child content here */,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 400.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'APP UI KIT',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(203, 251, 94, 1),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'WELCOME TO GEEZ APP',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.bold,
                                    color: neutral1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: SizedBox(
                                  width: 276.4.sp,
                                  child: Text(
                                    'Make your design workflow easier and save your time',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: neutral1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                } else {
                  return Scaffold(
                    body: Column(
                      children: [
                        Container(
                            height: 380.h,
                            width: 418.w,
                            child: Image.asset(
                              "assets/images/3.png",
                              fit: BoxFit.cover,
                            )),
                        Container(
                            color: Color.fromARGB(255, 14, 11, 31),
                            height: 431.h,
                            child: Column(children: [
                              SizedBox(
                                height: 15.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14.0.w),
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'APP UI KIT',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(203, 251, 94, 1),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14.0.w),
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'WELCOME TO GEEZ APP',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.bold,
                                      color: neutral1,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14.0.w),
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: SizedBox(
                                    width: 276.4.w,
                                    child: Text(
                                        'Make your design workflow easier and save your time',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: neutral1,
                                        )),
                                  ),
                                ),
                              ),
                            ]))
                      ],
                    ),
                  );
                }
              }),
        ),
        Align(
          alignment: Alignment(0.w, 0.686.w),
          child: Container(
            child: SmoothPageIndicator(
                controller: _controller, // PageController
                count: 3,
                effect: SlideEffect(
                    dotWidth: 6.w,
                    activeDotColor: Color.fromRGBO(203, 251, 94, 1),
                    dotHeight: 6.h,
                    radius: 0,
                    dotColor: Color.fromRGBO(
                        113, 115, 123, 1)), // your preferred effect
                onDotClicked: (index) {}),
          ),
        ),
        Align(
          alignment: Alignment(0.w, 0.880.w),
          child: RawMaterialButton(
            shape: BeveledRectangleBorder(),
            constraints: BoxConstraints(minHeight: 46.h, minWidth: 300.w),
            onPressed: () {
              _controller.nextPage(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOutQuart);
            },
            fillColor: Color.fromRGBO(203, 251, 94, 1),
            child: TextButton(
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Loginpage();
                }));
              },
            ),
          ),
        ),
      ]),
    );
  }
}
