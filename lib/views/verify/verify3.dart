import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:micmusic/views/TabScreen.dart';
// ignore: implementation_imports,
import '../widgets/signButton.dart' show SignUPinButton;
import 'verify2.dart';
import '../homePageView.dart';

class VerifyPage3 extends StatelessWidget {
  const VerifyPage3({super.key});

  void returnBack(BuildContext context) {
    Navigator.of(context).pop(MaterialPageRoute(builder: (context) {
      return const VerifyPage2();
    }));
  }

  void enterHomepage(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const TabScreenView()));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: const BoxDecoration(color: Color(0xFF0E0B1F)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 70.h,
                  ),
                  child: IconButton(
                    onPressed: () => returnBack(context),
                    icon: Icon(Icons.arrow_back,
                        color: Theme.of(context).canvasColor),
                  ),
                ),
                SizedBox(
                  height: 80.h,
                ),
                Center(
                  child: Text(
                    "Almost Done!",
                    style: TextStyle(
                        color: Theme.of(context).canvasColor,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: Text(
                    "Please Verify Your Phone",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 138, 137, 137),
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.h,
                ),
                Center(
                    child: SignUPinButton(
                        buttonText: 'CONTINUE', changePage: enterHomepage)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
