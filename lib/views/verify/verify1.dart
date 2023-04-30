import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

// ignore: implementation_imports,
import '../widgets/signButton.dart';
import '../loginPage.dart';
import 'verify2.dart';

class VerifyPage1 extends StatelessWidget {
  const VerifyPage1({super.key});

  void enterverifypage2(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const VerifyPage2();
    }));
  }

  void returnBack(BuildContext context) {
    Navigator.of(context).pop(MaterialPageRoute(builder: (context) {
      return const Loginpage();
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
                        color: Theme.of(context).canvasColor),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 160.h,
                  width: 253.w,
                  child: Text(
                    "To continue enter your phone number",
                    style: TextStyle(
                        fontSize: 29.sp,
                        color: Theme.of(context).canvasColor,
                        fontWeight: FontWeight.bold),
                    maxLines: 4,
                  ),
                ),
                SizedBox(
                  height: 65.h,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text(
                        "Phone",
                        style: TextStyle(
                            color: Color.fromARGB(255, 138, 137, 137)),
                      ),
                      // hintStyle: TextStyle(color: Color.fromARGB(255, 138, 137, 137)),
                      prefixIcon: Icon(Icons.phone_android),
                      prefixIconColor: Color.fromARGB(255, 138, 137, 137)),
                ),
                SizedBox(
                  height: 64.h,
                ),
                Center(
                    child: SignUPinButton(
                        buttonText: 'CONTINUE', changePage: enterverifypage2))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
