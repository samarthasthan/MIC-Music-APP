import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './passwordInputField.dart';
import 'TextInput.dart';

class SignUpFields extends StatefulWidget {
  const SignUpFields({
    super.key,
  });

  @override
  State<SignUpFields> createState() => _SignUpFieldsState();
}

// ignore: unused_element
class _SignUpFieldsState extends State<SignUpFields> {
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      bool _passwordVisible = false;
    }

    return Column(
      children: [
        const TextInput(
          labelText: "E-Mail",
          prefixIcon: Icons.email_outlined,
        ),
        SizedBox(
          height: 25.h,
        ),
        const PasswordInputField(),
      ],
    );
  }
}
