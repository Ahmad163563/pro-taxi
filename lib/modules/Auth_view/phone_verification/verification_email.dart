import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/modules/Auth_view/forget_password/forget_password_otp.dart';
import 'package:taxi/utills/components/textformfield.dart';
import 'package:taxi/utills/components/yellow_button.dart';

import '../../../utills/components/text_widget.dart';
import '../../../utills/controller/theme_controller/theme.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
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
              SizedBox(height: 25,),
               Row(
                 children: [
                   SizedBox(width: 5,),
                   CustomText(
                    label: '  Verification email or phone\n  number',
                    size: TextSize.extralarge,
                    weight: FontWeight.w500,
                    fontType: GoogleFonts.poppins,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                             ),
                 ],
               ),
              SizedBox(height: 30,),
              textFormField(hintText: 'Email or phone number'),
              SizedBox(height: 350,),
              YellowButton(buttonText: 'Send OTP', ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordOtp()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
