import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/modules/Auth_view/phone_verification/phone_verification.dart';
import 'package:taxi/utills/app_constant/app_color.dart';
import 'package:taxi/utills/components/text_widget.dart';
import 'package:taxi/utills/components/textformfield.dart';
import 'package:taxi/utills/components/yellow_button.dart';
import '../../../utills/controller/theme_controller/theme.dart';
import 'signup_controller.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final SignUpController signUpController = Get.put(SignUpController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
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
              ))),
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
                  label: 'Sign Up',
                  size: TextSize.large,
                  weight: FontWeight.bold,
                  fontType: GoogleFonts.poppins,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 10),
            textFormField(hintText: 'Name'),
            const SizedBox(height: 15),
            textFormField(hintText: 'Email'),
            const SizedBox(height: 15),
            textFormField(hintText: '+880 Your Mobile Number'),
            const SizedBox(height: 15),

            // ✅ Gender Dropdown with Obx
            Obx(() => DropdownButtonFormField<String>(
              value: signUpController.selectedGender.value,
              decoration: InputDecoration(
                hintText: 'Gender',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              ),
              icon: const Icon(Icons.arrow_drop_down),
              items: ["Male", "Female"].map((gender) {
                return DropdownMenuItem(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              onChanged: (value) {
                signUpController.selectedGender.value = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please select gender";
                }
                return null;
              },
            )),
            const SizedBox(height: 15),

            // ✅ Checkbox with Obx
            Obx(() => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 0.9,
                  child: Checkbox(
                    value: signUpController.isChecked.value,
                    onChanged: (value) {
                      signUpController.isChecked.value = value ?? false;
                    },
                    shape: const CircleBorder(),
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    side: BorderSide(
                      color: isDark ? Colors.green : Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: 14,
                      ),
                      children: const [
                        TextSpan(text: "By signing up you agree to the "),
                        TextSpan(
                          text: "Terms of Service ",
                          style: TextStyle(
                            color: Color(0xfff8c20d),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "and "),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            color: Color(0xfff8c20d),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
            const SizedBox(height: 15),

            YellowButton(
                buttonText: 'Sign Up',
                ontap: () {
                  if (signUpController.selectedGender.value == null) {
                    Get.snackbar("Error", "Please select a gender");
                  } else if (!signUpController.isChecked.value) {
                    Get.snackbar("Error", "Please accept terms");
                  } else {
                    Get.to(() => PhoneVerification());
                  }
                }),
            const SizedBox(height: 35),

            // ✅ Social login buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialIcon("assets/gmail.webp"),
                const SizedBox(width: 10),
                _socialIcon("assets/fb.webp"),
                const SizedBox(width: 10),
                _socialIcon("assets/appple.png"),
              ],
            ),
            const SizedBox(height: 25),

            RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontSize: 14,
                    ),
                    children: [
                      const TextSpan(text: "Already have an account? "),
                      TextSpan(
                        text: "Sign in",
                        style: const TextStyle(
                          color: Color(0xfff8c20d),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ]))
          ]),
        ),
      ),
    );
  }

  // ✅ Social Button Widget
  Widget _socialIcon(String asset) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.greyText)),
        child: Image.asset(asset),
      ),
    );
  }
}






class SignUpController extends GetxController {
  // TextControllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  // Gender
  var selectedGender = RxnString();

  // Checkbox
  var isChecked = false.obs;

  // Validation Example
  String? validateName(String value) {
    if (value.isEmpty) return "Name is required";
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) return "Email is required";
    if (!GetUtils.isEmail(value)) return "Invalid email";
    return null;
  }

  String? validatePhone(String value) {
    if (value.isEmpty) return "Phone is required";
    if (!GetUtils.isPhoneNumber(value)) return "Invalid phone number";
    return null;
  }

  // Submit Function
  void submit() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        selectedGender.value == null ||
        isChecked.value == false) {
      Get.snackbar("Error", "Please fill all fields and accept terms");
    } else {
      Get.snackbar("Success", "Sign Up Completed ✅");
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
