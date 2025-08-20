import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/modules/Auth_view/registration/registration2.dart';
import 'package:taxi/utills/components/textformfield.dart';
import 'package:taxi/utills/components/yellow_button.dart';

import '../../../utills/app_constant/app_color.dart';
import '../../../utills/components/text_widget.dart';
import '../../../utills/controller/theme_controller/theme.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
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
      body: SingleChildScrollView(
        child:  SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                  child: CustomText(
                label: 'Set Password',
                size: TextSize.extralarge,
                weight: FontWeight.w600,
                fontType: GoogleFonts.poppins,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              )),
              SizedBox(
                height: 10,
              ),
              CustomText(
                label: 'Set your password',
                size: TextSize.small,
                weight: FontWeight.w400,
                fontType: GoogleFonts.poppins,
                color: AppColors.greyText,
              ),
              SizedBox(
                height: 20,
              ),
              textFormField(
                hintText: 'Enter Your Password',
              ),
              SizedBox(
                height: 12,
              ),
              textFormField(hintText: 'Confirm Password'),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  CustomText(
                    label: 'Atleast 1 number or a special character',
                    size: TextSize.small,
                    weight: FontWeight.w400,
                    fontType: GoogleFonts.poppins,
                    color: AppColors.greyText,
                  ),
                ],
              ),
              SizedBox(
                height: 200,
              ),
              YellowButton(buttonText: 'Register', ontap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration2()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
