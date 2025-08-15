// utils/responsive_text.dart
import 'package:flutter/material.dart';
import 'screen_type.dart';

class ResponsiveText extends StatelessWidget {
  final String text;
  final double mobile;
  final double tablet;
  final double desktop;
  final TextStyle? style;
  final TextAlign? textAlign;
  final Color? color;
  final FontWeight? fontWeight;

  const ResponsiveText(
      this.text, {
        super.key,
        required this.mobile,
        required this.tablet,
        required this.desktop,
        this.style,
        this.textAlign,
        this.color,
        this.fontWeight,
      });

  @override
  Widget build(BuildContext context) {
    final type = ScreenTypeUtil.getScreenType(context);
    double size;

    switch (type) {
      case ScreenType.mobile:
        size = mobile;
        break;
      case ScreenType.tablet:
        size = tablet;
        break;
      case ScreenType.desktop:
        size = desktop;
        break;
    }

    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: (style ?? const TextStyle()).copyWith(
        fontSize: size,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}

// // utils/font_size_util.dart
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_responsive.dart';
// import 'package:taxi/utills/screens/screen_type.dart';
//
// class FontSizeUtil {
//   static double getFontSize(BuildContext context,
//       {required double mobile, required double tablet, required double desktop}) {
//     ScreenType type = ScreenTypeUtil.getScreenType(context);
//
//     switch (type) {
//       case ScreenType.mobile:
//         return mobile;
//       case ScreenType.tablet:
//         return tablet;
//       case ScreenType.desktop:
//         return desktop;
//     }
//   }
//
//   // Optional helpers
//   static double small(BuildContext context) {
//     return getFontSize(context, mobile: 12, tablet: 14, desktop: 36);
//   }
//   static double medium(BuildContext context) => getFontSize(context, mobile: 16, tablet: 18, desktop: 20);
//   static double large(BuildContext context) => getFontSize(context, mobile: 22, tablet: 24, desktop: 28);
// }