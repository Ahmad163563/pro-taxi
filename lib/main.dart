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
import 'package:taxi/modules/Chat_Screen/Chat_Screen.dart';
import 'package:taxi/modules/Discount_Screen/Discount_Screens.dart';
import 'package:taxi/modules/addresss/addresss.dart';
import 'package:taxi/modules/complain.dart';
import 'package:taxi/modules/drawer/drawer.dart';
import 'package:taxi/modules/faviorite_screen%5D/favorite_screen.dart';
import 'package:taxi/modules/google_location/google_location.dart';
import 'package:taxi/modules/history_status/history_status.dart';
import 'package:taxi/modules/onboarding_Screen/onboarding-screen1.dart';
import 'package:taxi/modules/profile_screen/profile_screen.dart';
import 'package:taxi/modules/referral.dart';
import 'package:taxi/modules/splash_screen/splash_screen.dart';
import 'package:taxi/modules/transport_selection/Payment_Method.dart';
import 'package:taxi/modules/transport_selection/available_transport2.dart';
import 'package:taxi/modules/transport_selection/cancel_order.dart';
import 'package:taxi/modules/transport_selection/car_booking.dart';
import 'package:taxi/modules/transport_selection/car_details3.dart';
import 'package:taxi/modules/transport_selection/confirm_ride.dart';
import 'package:taxi/modules/transport_selection/payment_method2.dart';
import 'package:taxi/modules/transport_selection/transport%20selection.dart';
import 'package:taxi/modules/wallet_screens/walllet_Screen.dart';
import 'package:taxi/settings_screens.dart';
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
        home: CarBookingScreen()//CarDetailsScreen()//GoogleLocation()//ForgetPasswordOtp()//EmailVerification()//ForgetPassword()//SignIn()//Registration2()//PhoneVerification()//SignUp()//SplashView()//Onboardingscreen1()//SplashScreen()
      ),
    );
  }
}
