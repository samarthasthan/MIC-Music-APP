// ignore_for_file: unused_import, unnecessary_import
// ignore: implementation_imports,
import 'dart:math';
import '../controllers/photosController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'forgetPassword/forgetPwPage1.dart';
import 'package:flutter/src/widgets/framework.dart';
// ignore: implementation_imports,
import 'package:flutter/src/widgets/placeholder.dart';
import './widgets/sign_up_field.dart';
import './homepage.dart';
import 'package:music_streaming/Views/signUp/signUpPage.dart';
import './widgets/signButton.dart';
import 'verify/verify1.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    final PhotoController photocontroller = PhotoController();

    void enterSignUpPage(BuildContext ctx) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const SignUpPage();
      }));
    }

    void enterforgetpw1(BuildContext ctx) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const FogetPw1();
      }));
    }

    void enterVerifyPage(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const VerifyPage1();
      }));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          photocontroller.getPhotoAsset('LoginPageBackground'),
                      fit: BoxFit.fill)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80.h,
                      ),
                      Text(
                        'SIGN IN',
                        style: TextStyle(
                          fontSize: 36.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 53.h,
                      ),
                      const SignUpFields(),
                      Padding(
                        padding: EdgeInsets.only(top: 36.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () => enterforgetpw1(context),
                                child: Text(
                                  "Forget Password ? ",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color.fromARGB(
                                          255, 138, 137, 137),
                                      fontWeight: FontWeight.w400),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Center(
                        child: SignUPinButton(
                          changePage: enterVerifyPage,
                          buttonText: "SIGN IN",
                        ),
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(
                              child: Divider(
                                  thickness: 1.5,
                                  color: Color.fromARGB(255, 138, 137, 137))),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            ' Or Connect with',
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 138, 137, 137),
                            ),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          const Expanded(
                              child: Divider(
                                  thickness: 1.5,
                                  color: Color.fromARGB(255, 138, 137, 137))),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            iconSize: 20,
                            onPressed: () => {},
                            icon: Image(
                                image:
                                    photocontroller.getPhotoAsset('facebook')),
                          ),
                          IconButton(
                            iconSize: 20,
                            onPressed: () => {},
                            icon: Image(
                                image: photocontroller.getPhotoAsset('google')),
                          ),
                          IconButton(
                            iconSize: 20,
                            onPressed: () => {},
                            icon: Image(
                                image:
                                    photocontroller.getPhotoAsset('twitter')),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dont\'t have an account?',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Theme.of(context).primaryColor),
                          ),
                          TextButton(
                              onPressed: () => enterSignUpPage(context),
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    fontSize: 14.sp, color: Color(0xFFFBEB5E)),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
