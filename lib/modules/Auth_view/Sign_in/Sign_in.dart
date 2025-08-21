import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/modules/Auth_view/forget_password/forget_password.dart';
import 'package:taxi/modules/Auth_view/sign_in/signin_controller.dart';

import '../../../utills/app_constant/app_color.dart';
import '../../../utills/components/text_widget.dart';
import '../../../utills/components/yellow_button.dart';
import '../../../utills/controller/theme_controller/theme.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final SignInController signInController = Get.put(SignInController());
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Back',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: isDark ? Colors.white : Colors.black,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 15),
                CustomText(
                  label: 'Sign in',
                  size: TextSize.large,
                  weight: FontWeight.w400,
                  fontType: GoogleFonts.poppins,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 25),

            // Email field
            TextField(
              controller: signInController.emailController,
              decoration: const InputDecoration(
                hintText: "Email or Phone Number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // Password field with Obx
            Obx(() => TextField(
              controller: signInController.passwordController,
              obscureText: signInController.isPasswordHidden.value,
              decoration: InputDecoration(
                hintText: "Enter Your Password",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(signInController.isPasswordHidden.value
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    signInController.isPasswordHidden.value =
                    !signInController.isPasswordHidden.value;
                  },
                ),
              ),
            )),
            const SizedBox(height: 10),

            // Forget password
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.to(() =>ForgetPassword());
                  },
                  child: CustomText(
                    label: 'forget password',
                    size: TextSize.small,
                    weight: FontWeight.w400,
                    fontType: GoogleFonts.poppins,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),

            // Button
            YellowButton(
              buttonText: 'Sign In',
              ontap: () {
                signInController.signIn();
              },
            ),
            const SizedBox(height: 35),

            // Social buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialBox('assets/gmail.webp'),
                const SizedBox(width: 10),
                _socialBox('assets/fb.webp'),
                const SizedBox(width: 10),
                _socialBox('assets/appple.png'),
              ],
            ),
            const SizedBox(height: 25),

            // RichText
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: 14,
                ),
                children: const [
                  TextSpan(text: "Don't have an account?"),
                  TextSpan(
                    text: " Sign up",
                    style: TextStyle(
                      color: Color(0xfff8c20d),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  // Social box widget
  Widget _socialBox(String asset) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.greyText)),
      child: Image.asset(asset),
    );
  }
}




class SignInController extends GetxController {
  // Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Password hide/show
  var isPasswordHidden = true.obs;

  // Form Key
  final formKey = GlobalKey<FormState>();

  // Remember me
  var rememberMe = false.obs;

  // Validation
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email or Phone is required";
    }
    if (!GetUtils.isEmail(value) && !GetUtils.isPhoneNumber(value)) {
      return "Enter valid email or phone";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be at least 6 chars";
    }
    return null;
  }

  // Login function (Dummy for now)
  void login() {
    if (formKey.currentState!.validate()) {
      Get.snackbar("Success", "Login successful!");
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signIn() {}
}
