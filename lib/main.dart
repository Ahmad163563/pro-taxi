import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi/modules/Auth_view/Sign_in/Sign_in.dart';
import 'package:taxi/modules/Auth_view/Sign_up/sign_up.dart';
import 'package:taxi/modules/Auth_view/Splash_vIEW/splash_view.dart';
import 'package:taxi/modules/Auth_view/forget_password/forget_password.dart';
import 'package:taxi/modules/Auth_view/forget_password/forget_password_otp.dart';
import 'package:taxi/modules/Auth_view/phone_verification/phone_verification.dart';
import 'package:taxi/modules/Auth_view/phone_verification/verification_email.dart';
import 'package:taxi/modules/Auth_view/registration/registration.dart';
import 'package:taxi/modules/Auth_view/registration/registration2.dart';
import 'package:taxi/modules/google_location/google_location.dart';
import 'package:taxi/modules/transport_selection/transport%20selection.dart';
import 'package:taxi/utills/controller/theme_controller/theme.dart';

void main() {
  Get.put(ThemeController(), permanent: true); // Controller init
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Obx(
          () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeController.theme,
        home: TransportSelection()//GoogleLocation()//ForgetPasswordOtp()//EmailVerification()//ForgetPassword() //SignIn()//Registration2()//Registration()//PhoneVerification()//SignUp()   // SplashView(),
      ),
    );
  }
}
