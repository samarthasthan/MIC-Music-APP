import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// ignore: implementation_imports,
import '../widgets/signButton.dart';
import 'verify1.dart';
import 'verify3.dart';

class VerifyPage2 extends StatelessWidget {
  const VerifyPage2({super.key});

  void returnBack(BuildContext context) {
    Navigator.of(context).pop(MaterialPageRoute(builder: (context) {
      return const VerifyPage1();
    }));
  }

  void enterVerifyPage3(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const VerifyPage3();
    }));
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
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 110.h,
                  width: 253.w,
                  child: Text(
                    "Verify Phone Number",
                    style: TextStyle(
                        fontSize: 28.sp,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                    maxLines: 3,
                  ),
                ),
                SizedBox(
                  height: 84.h,
                ),
                Center(
                  child: OtpTextField(
                    numberOfFields: 4,
                    // autoFocus: true,

                    focusedBorderColor:
                        const Color.fromARGB(255, 138, 137, 137),
                    disabledBorderColor:
                        const Color.fromARGB(255, 138, 137, 137),

                    textStyle: TextStyle(
                        color: const Color.fromARGB(255, 138, 137, 137),
                        fontSize: 20.sp),
                    showFieldAsBox: false,
                    borderWidth: 4.0,
                    // onCodeChanged: (String code) {
                    //   //handle validation or checks here if necessary
                    // },
                    // //runs when every textfield is filled
                    // onSubmit: (String verificationCode) {},
                  ),
                ),
                SizedBox(
                  height: 64.h,
                ),
                Center(
                    child: SignUPinButton(
                        buttonText: 'CONTINUE', changePage: enterVerifyPage3)),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Resent Code",
                      style: TextStyle(
                          color: const Color(0xFFCBFB5E), fontSize: 13.sp),
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
