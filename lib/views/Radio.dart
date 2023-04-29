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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: 40.h),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
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
            ],
          )),
    ));
  }
}

class RadioSlider extends StatefulWidget {
  late List<RadioImageForm> imageList;
  RadioSlider({super.key, required this.imageList});

  @override
  State<RadioSlider> createState() => _RadioSliderState();
}

class _RadioSliderState extends State<RadioSlider> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 187.h,
          width: 370.w, // card height
          child: PageView.builder(
            pageSnapping: true,
            itemCount: widget.imageList.length,
            controller: PageController(viewportFraction: 0.9),
            onPageChanged: (int index) => setState(() => _index = index),
            itemBuilder: (_, i) {
              return GestureDetector(
                onTap: () {
                  widget.imageList[i].onPress;
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.asset(
                    widget.imageList[i].imagePath,
                    height: 187.h,
                    width: 273.w,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
              width: 10,
              child: ColoredBox(
                  color: (_index == 0 ? Colors.blue : Colors.black26)),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              height: 10,
              width: 10,
              child: ColoredBox(
                  color: (_index == 1 ? Colors.blue : Colors.black26)),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              height: 10,
              width: 10,
              child: ColoredBox(
                  color: (_index == 2 ? Colors.blue : Colors.black26)),
            ),
          ],
        )
      ],
    );
  }
}
