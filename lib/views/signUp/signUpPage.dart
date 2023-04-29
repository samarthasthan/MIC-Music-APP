// ignore_for_file: unused_import, unnecessary_import
// ignore: implementation_imports,
import 'dart:math';
import '../verify/verify1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../widgets/TextInput.dart';

// ignore: implementation_imports,
import 'package:flutter/src/widgets/placeholder.dart';
import '../widgets/sign_up_field.dart';
import '../homepage.dart';
import 'signUpPage.dart';
import '../widgets/signButton.dart';
import '/views/loginPage.dart';
import '/controllers/photosController.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  void enterLoginPage(BuildContext ontext) {
    Navigator.of(context).pop(MaterialPageRoute(builder: (context) {
      return const Loginpage();
    }));
  }

  void enterVerifyPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const VerifyPage1();
    }));
  }

  @override
  Widget build(BuildContext context) {
    final PhotoController photocontroller = PhotoController();

    return Material(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: photocontroller.getPhotoAsset('background2'),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100.h,
                ),
                Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).canvasColor,
                  ),
                ),
                SizedBox(
                  height: 53.h,
                ),
                const TextInput(
                  labelText: "Name",
                  prefixIcon: Icons.account_circle,
                ),
                SizedBox(
                  height: 25.h,
                ),
                const TextInput(
                  labelText: "E-Mail",
                  prefixIcon: Icons.email_outlined,
                ),
                SizedBox(
                  height: 25.h,
                ),
                const TextInput(
                  labelText: "Password",
                  prefixIcon: Icons.lock_outlined,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                    child: SignUPinButton(
                        buttonText: 'Sign Up', changePage: enterVerifyPage)),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: SizedBox(
                    width: 295.w,
                    height: 46.h,
                    child: ElevatedButton(
                      onPressed: () => enterLoginPage(context),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            // color: const Color.fromARGB(255, 255, 255, 255),
                            color: Theme.of(context).canvasColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
