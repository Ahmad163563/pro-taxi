// utils/media_query_util.dart
import 'package:flutter/material.dart';

class MediaQueryUtil {
  static double screenWidth(BuildContext context){
    return  MediaQuery.of(context).size.width;
  }


  static double screenHeight(BuildContext context) {
    return  MediaQuery.of(context).size.height;
  }


  static double screenShortestSide(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide;

  static Orientation orientation(BuildContext context) =>
      MediaQuery.of(context).orientation;
}