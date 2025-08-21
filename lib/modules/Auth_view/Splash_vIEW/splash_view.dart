import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/modules/Auth_view/Sign_up/sign_up.dart';
import 'package:taxi/utills/components/yellow_button.dart';
import 'package:taxi/utills/controller/theme_controller/theme.dart';
import 'package:taxi/utills/app_constant/app_color.dart';
import 'package:taxi/utills/components/text_widget.dart';

import '../../controller/splash_view_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final SplashViewController controller = Get.put(SplashViewController());

    return Scaffold(
      appBar: AppBar(
        actions: [
          Obx(() => IconButton(
            onPressed: () {
              themeController.toggleTheme();
            },
            icon: Icon(
              themeController.isDark.value
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
          ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Center(
                child: Image.asset(
                  'assets/splash_view.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 15),
            CustomText(
              label: 'Welcome',
              size: TextSize.large,
              weight: FontWeight.bold,
              fontType: GoogleFonts.poppins,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
            const SizedBox(height: 10),
            CustomText(
              label: 'Have a better sharing experience',
              size: TextSize.minismall,
              weight: FontWeight.w400,
              fontType: GoogleFonts.poppins,
              color: AppColors.greyText,
            ),
            const SizedBox(height: 100),
            YellowButton(
              buttonText: 'Create an account',
              ontap: controller.goToSignUp,
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: controller.goToLogin,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.orange),
                ),
                child: Center(
                  child: Text(
                    'Log In',
                    style: TextStyle(color: AppColors.orange),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}




class SplashViewController extends GetxController {

  /// Navigate to SignUp screen
  void goToSignUp() {
    Get.to(() => SignUp());
  }

  /// Navigate to Login screen
  void goToLogin() {
    Get.snackbar("Coming Soon", "Login screen abhi link nahi hui!");
    // Example:
    // Get.to(() => const LoginScreen());
  }
}
