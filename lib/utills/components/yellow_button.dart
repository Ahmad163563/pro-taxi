import 'package:flutter/material.dart';
import 'package:taxi/utills/components/white-text.dart';


class YellowButton extends StatelessWidget {
  String buttonText;
  VoidCallback ontap;
  YellowButton({super.key, required this.buttonText, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: ontap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 18),
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
              color:  Color(0xfff8c20d),
              borderRadius: BorderRadius.circular(10)
          ),
          child: Center(child: WhiteTextWidget(text: buttonText),),
        ),
      );
  }
}