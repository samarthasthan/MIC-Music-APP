import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:micmusic/constants.dart';
import 'package:micmusic/controls/RadioController.dart';
import 'package:micmusic/custom_icons_icons.dart';
import 'package:micmusic/models/RadioModel.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Radio",
          style: GoogleFonts.roboto(
              fontSize: 48.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFEEEEEE)),
        ),
        backgroundColor: const Color(0xFF0E0B1F),
        elevation: 0.0,
      ),
      backgroundColor: const Color(0xFF0E0B1F),
      body: Body(),
      bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          color: Color(0xFF0E0B1F),
          child: SizedBox(
            height: 60.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: SizedBox(
                    height: 40.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          size: 20.h,
                          color: Color(0xFF71737B),
                        ),
                        Text(
                          "Home",
                          style: textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    //Navigate to Home
                  },
                ),
                GestureDetector(
                  child: SizedBox(
                    height: 40.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 20.h,
                          color: Color(0xFF71737B),
                        ),
                        Text(
                          "Explore",
                          style: textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    // Mavigate to explore
                  },
                ),
                GestureDetector(
                  child: SizedBox(
                    height: 40.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          CustomIcons.radio,
                          size: 20.h,
                          color: Color(0xFFCBFB5E),
                        ),
                        Text(
                          "Radio",
                          style: GoogleFonts.quicksand(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFCBFB5E),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    // Mavigate to Radio
                  },
                ),
                GestureDetector(
                  child: SizedBox(
                    height: 40.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          CustomIcons.single,
                          size: 20.h,
                          color: Color(0xFF71737B),
                        ),
                        Text(
                          "Account",
                          style: textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/");
                  },
                )
              ],
            ),
          )),
    );
  }
}

class Body extends StatelessWidget {
  Body({super.key});

  final RadioController _radioController = RadioController();
  final List<RadioImageForm> _imageList = RadioController().radioImageList;
  final List<RadioPopularForm> _radioPopularList =
      RadioController().radioPopularList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: 40.h),
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Geez Radio Weekly",
                        style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFEEEEEE)),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "Geez Radio Weekly",
                        style: GoogleFonts.roboto(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xFF71737B)),
                      )
                    ]),
              ),
              SizedBox(
                height: 18.h,
              ),
              RadioSlider(imageList: _imageList),
              SizedBox(
                height: 40.h,
              ),
              Container(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    "Popular",
                    style: GoogleFonts.roboto(
                        color: const Color(0xFFEEEEEE),
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp),
                  )),
              SizedBox(
                height: 20.h,
              ),
              Popular(radioPopularList: _radioPopularList)
            ],
          )),
    ));
  }
}

class RadioSlider extends StatelessWidget {
  late List<RadioImageForm> imageList;
  RadioSlider({super.key, required this.imageList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 187.h,
      width: 370.w, // card height
      child: PageView.builder(
        padEnds: false,
        pageSnapping: true,
        itemCount: imageList.length,
        controller: PageController(viewportFraction: 0.7),
        itemBuilder: (_, i) {
          return Transform.scale(
            scale: 1,
            child: GestureDetector(
              onTap: () {
                imageList[i].onPress;
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  imageList[i].imagePath,
                  height: 187.h,
                  width: 273.w,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Popular extends StatelessWidget {
  final List<RadioPopularForm> radioPopularList;
  const Popular({super.key, required this.radioPopularList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: radioPopularList.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () => radioPopularList[index].onPress(context),
            child: Container(
              padding: EdgeInsets.only(left: 20.w, bottom: 20.h),
              height: 80.h,
              width: 294.w,
              child: Row(children: [
                Image.asset(radioPopularList[index].imagePath,
                height: 80.h,
                width: 80.h,
                ),
                SizedBox(width: 16.w,),
                SizedBox(
                  height: 80.h,
                  width: 200.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(radioPopularList[index].title,
                        style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFFFFFFFF),
                        ),  
                      ),
                      Text(radioPopularList[index].description,
                        style: GoogleFonts.roboto(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFFFFFFFF)
                        ),
                      )
                    ],
                  ),
                )
              ]),
            ),
          );
        }));
  }
}
