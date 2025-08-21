import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/modules/Auth_view/phone_verification/verification_email.dart';
import 'package:taxi/utills/app_constant/app_color.dart';
import 'package:taxi/utills/components/text_widget.dart';
import 'package:taxi/utills/components/yellow_button.dart';

import '../../../utills/controller/theme_controller/theme.dart';
import '../../../utills/controller/forget_password_controller.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final ForgetPasswordController forgetController =
  Get.put(ForgetPasswordController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Back',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w100,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey
                : Colors.black,
          ),
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              CustomText(
                label: 'Forget Password',
                size: TextSize.extralarge,
                weight: FontWeight.w700,
                fontType: GoogleFonts.poppins,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
              const SizedBox(height: 10),
              CustomText(
                label:
                'Select which contact details should\n     we use to reset your password',
                size: TextSize.small,
                weight: FontWeight.w400,
                fontType: GoogleFonts.poppins,
                color: AppColors.greyText,
              ),
              const SizedBox(height: 40),

              // Option 1: Via SMS
              Obx(() => GestureDetector(
                onTap: () {
                  forgetController.selectOption(ResetOption.sms);
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color:
                    forgetController.selectedOption.value == ResetOption.sms
                        ? Colors.amber[700]
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: forgetController.selectedOption.value ==
                          ResetOption.sms
                          ? Colors.amber
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Row(
                    children: const [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.sms,
                            color: Color(0xfff8c20d), size: 20),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            label: 'Via SMS',
                            size: TextSize.small,
                            weight: FontWeight.w400,
                            fontType: GoogleFonts.poppins,
                            color: Colors.grey,
                          ),
                          CustomText(
                            label: '***** ***77',
                            size: TextSize.small,
                            weight: FontWeight.w600,
                            fontType: GoogleFonts.poppins,
                            color: Colors.grey,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),

              const SizedBox(height: 20),

              // Option 2: Via Email
              Obx(() => GestureDetector(
                onTap: () {
                  forgetController.selectOption(ResetOption.email);
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: forgetController.selectedOption.value ==
                        ResetOption.email
                        ? Colors.amber[700]
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: forgetController.selectedOption.value ==
                          ResetOption.email
                          ? Colors.amber
                          : Colors.yellowAccent,
                    ),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.email,
                            color: Color(0xfff8c20d), size: 20),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            label: 'Via Email',
                            size: TextSize.small,
                            weight: FontWeight.w400,
                            fontType: GoogleFonts.poppins,
                            color: Colors.grey,
                          ),
                          CustomText(
                            label: '***** *** *** xyz@xyz.com',
                            size: TextSize.small,
                            weight: FontWeight.w600,
                            fontType: GoogleFonts.poppins,
                            color:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.grey
                                : Colors.black,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),

              const SizedBox(height: 180),

              YellowButton(
                buttonText: 'Continue',
                ontap: () {
                  if (forgetController.selectedOption.value ==
                      ResetOption.email) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmailVerification(),
                      ),
                    );
                  } else {
                    // Yaha SMS verification screen open kr skte ho
                    Get.snackbar("Coming Soon", "SMS verification not implemented");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}




enum ResetOption { sms, email }

class ForgetPasswordController extends GetxController {
  // Default option: none
  var selectedOption = ResetOption.sms.obs;

  void selectOption(ResetOption option) {
    selectedOption.value = option;
  }
}
