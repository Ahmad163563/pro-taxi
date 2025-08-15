import 'package:flutter/material.dart';
import 'package:untitled2/Controllerr/app_constansts/app_colors.dart';
import 'package:untitled2/main.dart';


class WhiteTextWidget extends StatelessWidget {
  final String text;
  final TextAlign textAligh;
  final double? size;
  final FontWeight fontWeight;
  WhiteTextWidget({super.key,
    this.fontWeight=FontWeight.w300,
    required this.text, this.textAligh=TextAlign.center, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: Colors.white,
        fontWeight: fontWeight,fontSize: size??FontSize.getMedium(context)),);
  }
}