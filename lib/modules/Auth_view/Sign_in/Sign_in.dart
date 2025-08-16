import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utills/components/text_widget.dart';
import '../../../utills/components/textformfield.dart';
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
                    weight: FontWeight.bold,
                    fontType: GoogleFonts.poppins,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textFormField(hintText: 'Email or Phone Number'),
              SizedBox(
                height: 15,
              ),
              textFormField(hintText: 'Enter Your Password'),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 0.9,
                    child: Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                      shape: CircleBorder(),
                      activeColor: Colors.green, // checked color
                      checkColor:
                      isDark ? Colors.white : Colors.white, // tick color
                      side: BorderSide(
                        color: isDark ? Colors.green : Colors.black, // border color
                      ),
                    ),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                          fontSize: 14,
                        ),
                        children: [
                          const TextSpan(text: "By signing up you agree to the "),
                          TextSpan(
                            text: "Terms of Service ",
                            style: const TextStyle(
                              color: Color(0xfff8c20d),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(text: "and "),
                          TextSpan(
                            text: "Privacy Policy",
                            style: const TextStyle(
                              color: Color(0xfff8c20d),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              YellowButton(buttonText: 'Sign Up', ontap: () {}),
              SizedBox(
                height: 25,
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
                        const TextSpan(text: "Already have an account?"),
                        TextSpan(
                          text: "Sign in",
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
