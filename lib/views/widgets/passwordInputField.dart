import 'package:flutter/material.dart';
import 'package:micmusic/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({super.key});

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      bool _passwordVisible = false;
    }

    return TextFormField(
      style: TextStyle(color: Colors.white),
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: neutral1)),
        label: Text(
          'Password',
          style: TextStyle(
              color: Color.fromARGB(255, 138, 137, 137), fontSize: 18.sp),
        ),
        prefixIcon: const Icon(Icons.lock_open_rounded),
        prefixIconColor: const Color.fromARGB(255, 138, 137, 137),
        suffixIcon: IconButton(
            color: Colors.white,
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
            icon: _passwordVisible
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off)),
      ),
    );
  }
}
