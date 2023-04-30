import 'dart:ffi';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUPinButton extends StatelessWidget {
  const SignUPinButton(
      {super.key, required this.buttonText, required this.changePage});
  final buttonText;
  final Function changePage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 295.w,
      height: 46.h,
      child: ElevatedButton(
        onPressed: () => changePage(context),
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(side: BorderSide.none),
          backgroundColor: const Color(0xFFCBFB5E),
          // shape: ,
        ),
        child: Text(
          buttonText,
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
