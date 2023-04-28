import 'package:flutter/material.dart';

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
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          label: Text(
            labelText,
            style: const TextStyle(color: Color.fromARGB(255, 138, 137, 137)),
          ),
          // hintStyle: TextStyle(color: Color.fromARGB(255, 138, 137, 137)),
          prefixIcon: Icon(prefixIcon),
          prefixIconColor: const Color.fromARGB(255, 138, 137, 137)),
    );
  }
}
