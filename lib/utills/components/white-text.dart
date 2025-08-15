import 'package:flutter/material.dart';

class WhiteTextWidget extends StatelessWidget {
  final String text;
  final TextAlign textAligh;
  final double? size;
  final FontWeight fontWeight;

  const WhiteTextWidget({
    super.key,
    this.fontWeight = FontWeight.w300,
    required this.text,
    this.textAligh = TextAlign.center,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAligh,
      style: TextStyle(
        color: Colors.white,
        fontWeight: fontWeight,
        fontSize: size
      ),
    );
  }
}
