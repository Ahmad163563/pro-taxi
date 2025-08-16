import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/utills/app_constant/app_color.dart';
import 'package:taxi/utills/components/text_widget.dart';
import 'package:taxi/utills/components/textformfield.dart';
import 'package:taxi/utills/components/white-text.dart';
import 'package:taxi/utills/components/yellow_button.dart';

import '../../../utills/controller/theme_controller/theme.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;
  String? selectedGender;
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
                label: 'Sign Up',
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
          textFormField(hintText: 'Name'),
          SizedBox(
            height: 15,
          ),
          textFormField(hintText: 'Email'),
          SizedBox(
            height: 15,
          ),
          textFormField(hintText: '+880 Your Mobile Number'),
          SizedBox(
            height: 15,
          ),
          DropdownButtonFormField<String>(
              value: selectedGender,
              decoration: InputDecoration(
                hintText: 'Gender',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              ),
              icon: Icon(Icons.arrow_drop_down), // arrow icon
              items: ["Male", "Female"].map((gender) {
                return DropdownMenuItem(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please select gender";
                }
              }),
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
                const TextSpan(text: "Already have an account?"),
                TextSpan(
                  text: "Sign in",
                  style: const TextStyle(
                    color: Color(0xfff8c20d),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]))
        ])));
  }
}
