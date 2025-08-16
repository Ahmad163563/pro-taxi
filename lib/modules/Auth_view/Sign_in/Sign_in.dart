import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utills/app_constant/app_color.dart';
import '../../../utills/components/text_widget.dart';
import '../../../utills/components/textformfield.dart';
import '../../../utills/components/yellow_button.dart';
import '../../../utills/controller/theme_controller/theme.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Back',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w100,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
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
        body: SafeArea(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                   CustomText(
                    label: 'Sign in',
                    size: TextSize.large,
                    weight: FontWeight.w400,
                    fontType: GoogleFonts.poppins,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              textFormField(hintText: 'Email or Phone Number'),
              SizedBox(
                height: 15,
              ),
              textFormField(hintText: 'Enter Your Password'),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                      onTap: (){},
                      child: CustomText(label: 'forget password', size: TextSize.small, weight: FontWeight.w400, fontType: GoogleFonts.poppins,color: Colors.red,)),
                ],
              ),
              SizedBox(height: 35,),
              YellowButton(buttonText: 'Sign Up', ontap: () {}),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.greyText)),
                    child: Image.asset('assets/gmail.webp'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.greyText)),
                    child: Image.asset('assets/fb.webp'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.greyText)),
                    child: Image.asset('assets/appple.png'),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: 14,
                      ),
                      children: [
                        const TextSpan(text: "Don't have an account?"),
                        TextSpan(
                          text: " Sign up",
                          style: const TextStyle(
                            color: Color(0xfff8c20d),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]))
            ]))
    );
  }
}
