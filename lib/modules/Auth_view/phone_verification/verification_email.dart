import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/modules/Auth_view/forget_password/forget_password_otp.dart';
import 'package:taxi/utills/components/textformfield.dart';
import 'package:taxi/utills/components/yellow_button.dart';
import '../../../utills/components/text_widget.dart';
import '../../../utills/controller/theme_controller/theme.dart';
import 'email_verification_controller.dart';

class EmailVerification extends StatelessWidget {
  EmailVerification({super.key});

  final EmailVerificationController controller =
  Get.put(EmailVerificationController());

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
                themeController.isDark.value
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
              )))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 25),
                Row(
                  children: [
                    CustomText(
                      label: 'Verification email or phone\nnumber',
                      size: TextSize.extralarge,
                      weight: FontWeight.w500,
                      fontType: GoogleFonts.poppins,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                textFormField(
                  hintText: 'Email or phone number',
                  controller: controller.emailOrPhoneController,
                  validator: controller.validateInput,
                ),
                const SizedBox(height: 350),
                Obx(() => YellowButton(
                  buttonText: controller.isLoading.value
                      ? "Sending..."
                      : "Send OTP",
                  ontap: () {
                    controller.sendOtp();
                    if (!controller.isLoading.value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPasswordOtp()),
                      );
                    }
                  },
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





class EmailVerificationController extends GetxController {
  // Text Controller for input
  final TextEditingController emailOrPhoneController = TextEditingController();

  // To show loading state while sending OTP
  var isLoading = false.obs;

  // Validator for input
  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return "This field cannot be empty";
    }
    // Example: Check if input contains "@" for email
    if (!value.contains("@") && value.length < 10) {
      return "Enter valid email or phone number";
    }
    return null;
  }

  // Method to handle OTP send
  void sendOtp() async {
    if (validateInput(emailOrPhoneController.text) != null) {
      Get.snackbar("Error", validateInput(emailOrPhoneController.text)!,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2)); // Fake API Call

    isLoading.value = false;
    Get.snackbar("Success", "OTP sent successfully!",
        snackPosition: SnackPosition.BOTTOM);

    // Navigate to OTP Screen
    // Use Get.toNamed() if you use named routes
  }

  @override
  void onClose() {
    emailOrPhoneController.dispose();
    super.onClose();
  }
}
