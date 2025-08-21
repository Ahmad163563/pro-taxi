import 'package:flutter/material.dart';

class textFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const textFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.validator,this.suffixIcon
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}


// SizedBox(
// width: 320,
// height: 54,
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 18.0),
// child: