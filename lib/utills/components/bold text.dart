import 'package:flutter/material.dart';
import 'package:untitled2/Controllerr/app_constansts/app_colors.dart';
import 'package:untitled2/main.dart' show FontSize;

import '../app_constant/app_color.dart';

class BoldText extends StatelessWidget {
  final String text;
  final double? size;

  const BoldText({super.key, required this.text, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.blackColor,
        fontSize: size ?? FontSize.getLarge(context), // default set here
        fontWeight: FontWeight.bold,
      ),
    );
  }
}