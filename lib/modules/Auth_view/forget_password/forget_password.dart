import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/utills/app_constant/app_color.dart';
import 'package:taxi/utills/components/text_widget.dart';
import 'package:taxi/utills/components/yellow_button.dart';

import '../../../utills/controller/theme_controller/theme.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
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
                themeController.isDark.value == true
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
              )))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
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
            SizedBox(height: 10),
            CustomText(
              label:
                  'Select which contact details should\n     we use to reset your password',
              size: TextSize.small,
              weight: FontWeight.w400,
              fontType: GoogleFonts.poppins,
              color: AppColors.greyText,
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.amber[700],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: const [
                    CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.sms,
                            color: Color(0xfff8c20d), size: 20)),
                    SizedBox(width: 15),
                    Column(
                      children: [
                        CustomText(
                          label: 'Via sms',
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
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Option 2: Via Email
            GestureDetector(
              onTap: () {
                // handle Email option
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.yellowAccent),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.email,
                            color: Color(0xfff8c20d), size: 20)),
                    SizedBox(width: 15),
                    Column(
                      children: [
                        CustomText(
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
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.grey
                              : Colors.black,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 120,),
            YellowButton(buttonText: 'Continue', ontap: (){})
          ],
        ),
      ),
    );
  }
}
