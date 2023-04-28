import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../widgets/passwordInputField.dart';
import '../widgets/TextInput.dart';

// ignore: implementation_imports,
import '../widgets/signButton.dart';
import 'forgetPwPage1.dart';

class ForgetPw2 extends StatelessWidget {
  const ForgetPw2({super.key});

  void returnBack1(BuildContext context) {
    Navigator.of(context).pop(MaterialPageRoute(builder: (context) {
      return const FogetPw1();
    }));
  }

  void returnToLoginPage(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        decoration: const BoxDecoration(color: Color(0xFF0E0B1F)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 70.h,
                    ),
                    child: IconButton(
                      onPressed: () => returnBack1(context),
                      icon: Icon(Icons.arrow_back,
                          color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Forgot Password ? ',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
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
              const PasswordInputField(),
              const TextInput(
                  labelText: 'Confirm Password',
                  prefixIcon: Icons.lock_outline),
              SizedBox(
                height: 60.h,
              ),
              Center(
                  child: SignUPinButton(
                      buttonText: "Change Password",
                      changePage: returnToLoginPage))
            ],
          ),
        ),
      ),
    ));
  }
}
