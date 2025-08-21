import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/modules/Auth_view/registration/registration.dart';
import 'package:taxi/utills/app_constant/app_color.dart';
import 'package:taxi/utills/components/yellow_button.dart';
import '../../../utills/components/text_widget.dart';
import '../../../utills/controller/theme_controller/theme.dart';
import 'phone_verification_controller.dart';

class PhoneVerification extends StatelessWidget {
  PhoneVerification({super.key});

  final PhoneVerificationController controller =
  Get.put(PhoneVerificationController());

  // OTP box banane ka function
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
        onChanged: (value) => controller.onOtpChange(value, index),
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
            color: isDark ? Colors.grey : Colors.black,
          ),
        ),
        actions: [
          Obx(() => IconButton(
            onPressed: () {
              themeController.toggleTheme();
            },
            icon: Icon(
              themeController.isDark.value
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
          ))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          children: [
            SizedBox(height: height * 0.035),
            Center(
              child: CustomText(
                label: 'Phone Verification',
                size: TextSize.extralarge,
                weight: FontWeight.w600,
                fontType: GoogleFonts.poppins,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            CustomText(
              label: 'Enter your OTP code',
              size: TextSize.small,
              weight: FontWeight.w400,
              fontType: GoogleFonts.poppins,
              color: AppColors.greyText,
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  5, (index) => buildOTPField(index, height, width)),
            ),
            const SizedBox(height: 25),
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
                        fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = controller.resendOtp,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 200),
            YellowButton(
              buttonText: 'Verify',
              ontap: () {
                controller.verifyOtp();
                // Example: navigate
                // Navigator.push(context, MaterialPageRoute(builder: (_) => Registration()));
              },
            ),
          ],
        ),
      ),
    );
  }
}




class PhoneVerificationController extends GetxController {
  // OTP fields controllers
  final List<TextEditingController> otpControllers =
  List.generate(5, (_) => TextEditingController());

  // Focus nodes for OTP
  final List<FocusNode> focusNodes = List.generate(5, (_) => FocusNode());

  // OTP value observable
  var otpCode = "".obs;

  // Update OTP when user types
  void onOtpChange(String value, int index) {
    if (value.isNotEmpty && index < 4) {
      focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    otpCode.value = otpControllers.map((c) => c.text).join();
  }

  // Verify OTP
  void verifyOtp() {
    if (otpCode.value.length == 5) {
      Get.snackbar("Success", "OTP Verified: ${otpCode.value}");
      // Navigate to next screen
      // Get.to(() => Registration());
    } else {
      Get.snackbar("Error", "Please enter complete OTP");
    }
  }

  // Resend OTP
  void resendOtp() {
    Get.snackbar("Resend", "A new OTP has been sent");
    // yahan API call bhi laga skte ho
  }

  @override
  void onClose() {
    for (var c in otpControllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.onClose();
  }
}
