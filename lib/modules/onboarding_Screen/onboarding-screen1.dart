import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/modules/Auth_view/Splash_vIEW/splash_view.dart';
import 'package:taxi/utills/app_constant/app_color.dart';
import 'package:taxi/utills/components/text_widget.dart';

import '../../controller/onboarding_controller.dart';

class Onboardingscreen1 extends StatelessWidget {
  const Onboardingscreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: controller.skipOnboarding,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CustomText(
                  label: 'Skip',
                  size: TextSize.small,
                  weight: FontWeight.w400,
                  fontType: GoogleFonts.poppins,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Center(
                child: Image.asset('assets/onboarding1.png'),
              ),
            ),
            const SizedBox(height: 15),
            CustomText(
              label: 'Anywhere you are',
              size: TextSize.large,
              weight: FontWeight.bold,
              fontType: GoogleFonts.poppins,
            ),
            const SizedBox(height: 10),
            CustomText(
              label: '    Sell houses easily with the help of\n'
                  '  listenoryx and to make this line big\n'
                  '               i am waiting more',
              size: TextSize.minismall,
              weight: FontWeight.w400,
              fontType: GoogleFonts.poppins,
              color: AppColors.greyText,
            ),
            const SizedBox(height: 60),
            CircleAvatar(
              radius: 35,
              backgroundColor: AppColors.orange,
              child: IconButton(
                onPressed: controller.nextOnboarding,
                icon: Icon(Icons.arrow_forward, color: AppColors.blackColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class OnboardingController extends GetxController {
  /// Skip button press
  void skipOnboarding() {
    Get.offAll(() => const SplashView());
  }

  /// Next button press (arrow forward)
  void nextOnboarding() {
    Get.to(() => const SplashView());
  }
}

