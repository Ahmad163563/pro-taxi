import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/modules/google_location/google_location.dart';
import 'package:taxi/utills/app_constant/app_color.dart';
import 'package:taxi/utills/components/yellow_button.dart';
import '../../../utills/components/text_widget.dart';
import '../../../utills/controller/theme_controller/theme.dart';
import 'forget_password_otp_controller.dart';

class ForgetPasswordOtp extends StatelessWidget {
  ForgetPasswordOtp({super.key});

  final ForgetPasswordOtpController controller =
  Get.put(ForgetPasswordOtpController());

  Widget buildOTPField(int index, double height, double width) {
    return Container(
      height: height * 0.06,
      width: width * 0.10,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(),
      ),
      child: TextFormField(
        controller: controller.otpControllers[index],
        focusNode: controller.focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: GoogleFonts.poppins(fontSize: height * 0.03),
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
        onChanged: (value) => controller.onOtpChanged(value, index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            children: [
              SizedBox(height: height * 0.035),
              Center(
                  child: CustomText(
                    label: 'Forgot Password',
                    size: TextSize.extralarge,
                    weight: FontWeight.w600,
                    fontType: GoogleFonts.poppins,
                    color: isDark ? Colors.white : Colors.black,
                  )),
              const SizedBox(height: 10),
              CustomText(
                label: 'Code has been sent to ***** ****70',
                size: TextSize.small,
                weight: FontWeight.w400,
                fontType: GoogleFonts.poppins,
                color: AppColors.greyText,
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    5, (index) => buildOTPField(index, height, width,),),
              ),
              SizedBox(height: 25),
              RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: 14,
                      ),
                      children: [
                        const TextSpan(text: "Didn't receive a code?"),
                        TextSpan(
                          text: " Resend again",
                          style: const TextStyle(
                            color: Color(0xfff8c20d),
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Resend OTP API call
                              Get.snackbar("OTP", "Resend OTP requested");
                            },
                        ),
                      ])),
              SizedBox(height: 250),
              YellowButton(
                  buttonText: 'Verify',
                  ontap: () {
                    controller.verifyOtp();
                    if (controller.otpCode.value.length == 5) {
                      Get.to(() => GoogleLocation());
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}






class ForgetPasswordOtpController extends GetxController {
  // List of TextEditingControllers for OTP
  final List<TextEditingController> otpControllers =
  List.generate(5, (_) => TextEditingController());

  // List of FocusNodes for OTP
  final List<FocusNode> focusNodes = List.generate(5, (_) => FocusNode());

  // Reactive OTP string
  var otpCode = "".obs;

  // Update OTP value on change
  void onOtpChanged(String value, int index) {
    if (value.isNotEmpty && index < otpControllers.length - 1) {
      FocusScope.of(Get.context!).requestFocus(focusNodes[index + 1]);
    }
    if (value.isEmpty && index > 0) {
      FocusScope.of(Get.context!).requestFocus(focusNodes[index - 1]);
    }

    // Join all values into one OTP string
    otpCode.value = otpControllers.map((c) => c.text).join();
  }

  // OTP verify function (API call ya validation ke liye use ho skta hai)
  void verifyOtp() {
    if (otpCode.value.length == 5) {
      Get.snackbar("OTP", "Entered OTP is ${otpCode.value}");
      // API call or navigation
    } else {
      Get.snackbar("Error", "Please enter complete OTP");
    }
  }

  @override
  void onClose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.onClose();
  }
}
