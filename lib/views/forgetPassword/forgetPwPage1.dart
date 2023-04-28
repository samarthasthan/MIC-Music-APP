// ignore_for_file: unused_import, unnecessary_import
// ignore: implementation_imports,
import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:music_streaming/Views/forgetPassword/forgetPwPage2.dart';
import '../widgets/TextInput.dart';
import 'package:flutter/src/widgets/framework.dart';
// ignore: implementation_imports,
import 'package:flutter/src/widgets/placeholder.dart';
import '../widgets/sign_up_field.dart';
import '../homepage.dart';
import 'package:music_streaming/Views/signUp/signUpPage.dart';
import '../widgets/signButton.dart';
import '../loginPage.dart';

class FogetPw1 extends StatelessWidget {
  const FogetPw1({super.key});

  @override
  Widget build(BuildContext context) {
    void enterforgetPw2(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const ForgetPw2();
      }));
    }

    void returnBack(BuildContext context) {
      Navigator.of(context).pop(MaterialPageRoute(builder: (context) {
        return const Loginpage();
      }));
    }

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
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Forgot Password ? ',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                SizedBox(
                  height: 60.h,
                  width: 250.w,
                  child: Text(
                    "If you need help resetting your password, we can help by sending you a link to reset it.",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color.fromARGB(255, 138, 137, 137),
                    ),
                    maxLines: 3,
                  ),
                ),
                SizedBox(
                  height: 80.h,
                ),
                const TextInput(
                    labelText: 'E-Mail', prefixIcon: Icons.email_outlined),
                SizedBox(
                  height: 60.h,
                ),
                Center(
                    child: SignUPinButton(
                        buttonText: "SEND OTP", changePage: enterforgetPw2))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
