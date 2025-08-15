import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/utills/app_constant/app_color.dart';
import 'package:taxi/utills/components/text_widget.dart';
import 'package:taxi/utills/components/white-text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orange,
      body: SafeArea(child: Column(
        children: [
          SizedBox(height: 150,),
          Center(
            child: Image.asset('assets/splash_screen.jpg',height: 100,width: 250,),
          ),
          SizedBox(height: 10,),
          CustomText(label: 'Easy Rider', size: TextSize.extralarge, weight: FontWeight.bold, fontType: GoogleFonts.poppins,color: AppColors.whiteColor,)
        ],
      )),
    );
  }
}
