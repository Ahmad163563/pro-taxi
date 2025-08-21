import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/modules/Auth_view/registration/registration2.dart';
import 'package:taxi/utills/components/textformfield.dart';
import 'package:taxi/utills/components/yellow_button.dart';
import '../../../utills/app_constant/app_color.dart';
import '../../../utills/components/text_widget.dart';
import '../../../utills/controller/theme_controller/theme.dart';
import 'registration_controller.dart';

class Registration extends StatelessWidget {
  Registration({super.key});

  final RegistrationController regController =
  Get.put(RegistrationController());

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
            ),
          ))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: regController.formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
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
                const SizedBox(height: 10),
                CustomText(
                  label: 'Set your password',
                  size: TextSize.small,
                  weight: FontWeight.w400,
                  fontType: GoogleFonts.poppins,
                  color: AppColors.greyText,
                ),
                const SizedBox(height: 20),

                // Password field
                Obx(() => textFormField(
                  controller: regController.passwordController,
                  hintText: 'Enter Your Password',
                  obscureText: regController.isPasswordHidden.value,
                  validator: regController.validatePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      regController.isPasswordHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      regController.isPasswordHidden.value =
                      !regController.isPasswordHidden.value;
                    },
                  ),
                )),

                const SizedBox(height: 12),

// ✅ Confirm Password field (fixed)
                Obx(() => textFormField(
                  controller: regController.confirmPasswordController,  // ✅ yaha confirm use karna hai
                  hintText: 'Confirm Password',
                  obscureText: regController.isConfirmPasswordHidden.value, // ✅ alag obs use karna hai
                  validator: regController.validateConfirmPassword,   // ✅ confirm wala validator use karo
                  suffixIcon: IconButton(
                    icon: Icon(
                      regController.isConfirmPasswordHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      regController.isConfirmPasswordHidden.value =
                      !regController.isConfirmPasswordHidden.value;
                    },
                  ),
                )),


                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 15),
                    CustomText(
                      label: 'At least 1 number or a special character',
                      size: TextSize.small,
                      weight: FontWeight.w400,
                      fontType: GoogleFonts.poppins,
                      color: AppColors.greyText,
                    ),
                  ],
                ),
                const SizedBox(height: 200),

                YellowButton(
                  buttonText: 'Register',
                  ontap: () {
                    regController.register();
                    // If valid, navigate
                    // Get.to(() => Registration2());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}




class RegistrationController extends GetxController {
  // TextEditingControllers for password fields
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // For showing/hiding password
  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;

  // Form key
  final formKey = GlobalKey<FormState>();

  // Validation method
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters";
    } else if (!RegExp(r'^(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
        .hasMatch(value)) {
      return "Must contain number & special character";
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  // Register button function
  void register() {
    if (formKey.currentState!.validate()) {
      Get.snackbar("Success", "Password set successfully ✅",
          snackPosition: SnackPosition.BOTTOM);
      // navigate to next screen
      // Get.to(() => Registration2());
    }
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
