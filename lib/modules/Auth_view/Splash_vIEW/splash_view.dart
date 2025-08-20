import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/modules/Auth_view/Sign_up/sign_up.dart';
import 'package:taxi/utills/components/yellow_button.dart';
import 'package:taxi/utills/controller/theme_controller/theme.dart';

import '../../../utills/app_constant/app_color.dart';
import '../../../utills/components/text_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Obx(()=> IconButton(onPressed: (){
            themeController.toggleTheme();
          }, icon: Icon(
            themeController.isDark.value == true
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined,
          )
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
              ))),
                    SizedBox(
            height: 15,
                    ),
                    CustomText(
              label: 'Welcome',
              size: TextSize.large,
              weight: FontWeight.bold,
              fontType: GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,),
                    SizedBox(
            height: 10,
                    ),
                    CustomText(
            label: 'Have a better sharing experience',
            size: TextSize.minismall,
            weight: FontWeight.w400,
            fontType: GoogleFonts.poppins,
            color: AppColors.greyText,
                    ),
                    SizedBox(
            height: 100,
                    ),
                    YellowButton(buttonText: 'Create an account', ontap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                    }),
                    SizedBox(
            height: 10,
                    ),
                    InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.orange)),
              child: Center(
                  child: Text(
                'Log In',
                style: TextStyle(color: AppColors.orange),
              )),
            ),
                    )
                  ]),
          )),
      );
  }
}
