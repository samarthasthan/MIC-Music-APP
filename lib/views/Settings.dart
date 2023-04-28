import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micmusic/Controls/SettingsController.dart';
import 'package:micmusic/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:micmusic/custom_icons_icons.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        backgroundColor: Color(0xFF0E0B1F),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color(0xFF0E0B1F),
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 80.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TopPart(),
          SignOutButton(),
        ],
      ),
    );
  }
}

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.h,
      width: 295.w,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
            side: BorderSide(color: Color(0xFFCBFB5E)),
          ),
          onPressed: () {
            //Handle Sign Out
          },
          child: Text(
            "SIGN OUT",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFFCBFB5E)),
          )),
    );
  }
}

class TopPart extends StatefulWidget {
  const TopPart({super.key});

  @override
  State<TopPart> createState() => _TopPartState();
}

class _TopPartState extends State<TopPart> {
  final SettingsController _settingsController = SettingsController();

  late bool isNotificationsAllowed = _settingsController.isNotificationsAllowed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.notification_important_outlined,
                  color: iconColor,
                  size: 24,
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  "Notification",
                  style: textTheme.headlineMedium,
                ),
                Spacer(
                  flex: 15,
                ),
                Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                      value: isNotificationsAllowed,
                      thumbColor: Colors.white,
                      activeColor: Color(0xFFCBFB5E),
                      onChanged: (_) {
                        print("Notifications Settings Changed.");
                        setState(() {
                          isNotificationsAllowed = _;
                        });
                      }),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              color: Color(0xFFFFFFFF),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.text_fields_outlined,
                  color: iconColor,
                  size: 24,
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  "Display Language",
                  style: textTheme.headlineMedium,
                ),
                Spacer(
                  flex: 15,
                ),
                Text(
                  _settingsController.displayLanguage,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xFFCBFB5E),
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              color: Color(0xFFFFFFFF),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Icon(
                  CustomIcons.equalizer,
                  color: iconColor,
                  size: 24,
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  "Equalizer",
                  style: textTheme.headlineMedium,
                ),
                Spacer(
                  flex: 15,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFFEEEEEE),
                  size: 24.h,
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              color: Color(0xFFFFFFFF),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: iconColor,
                  size: 24,
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  "Terms of Service",
                  style: textTheme.headlineMedium,
                ),
                Spacer(
                  flex: 15,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFFEEEEEE),
                  size: 24.h,
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              color: Color(0xFFFFFFFF),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.headphones_outlined,
                  color: iconColor,
                  size: 24,
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  "Version${_settingsController.version}",
                  style: textTheme.headlineMedium,
                ),
                Spacer(
                  flex: 15,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              color: Color(0xFFFFFFFF),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ],
    );
  }
}
