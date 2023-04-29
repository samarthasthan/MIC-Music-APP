import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:micmusic/constants.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.labelText,
    required this.prefixIcon,
  });
  final labelText;
  final prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: brand1,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: neutral1)),
          label: Text(
            labelText,
            style: TextStyle(
                color: Color.fromARGB(255, 138, 137, 137), fontSize: 18.sp),
          ),
          // hintStyle: TextStyle(color: Color.fromARGB(255, 138, 137, 137)),
          prefixIcon: Icon(prefixIcon),
          prefixIconColor: const Color.fromARGB(255, 138, 137, 137)),
    );
  }
}
