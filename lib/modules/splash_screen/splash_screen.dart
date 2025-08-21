import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/utills/app_constant/app_color.dart';
import 'package:taxi/utills/components/text_widget.dart';

import '../../controller/splash_controller.dart';
import '../onboarding_Screen/onboarding-screen1.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orange,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 150),
            Center(
              child: Image.asset(
                'assets/splash_screen.jpg',
                height: 100,
                width: 250,
              ),
            ),
            const SizedBox(height: 30),
            CustomText(
              label: 'Easy Rider',
              size: TextSize.extralarge,
              weight: FontWeight.bold,
              fontType: GoogleFonts.poppins,
              color: AppColors.whiteColor,
            )
          ],
        ),
      ),
    );
  }
}




class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(() =>Onboardingscreen1());
  }
}
