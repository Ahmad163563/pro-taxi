import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/utills/app_constant/app_color.dart';
import 'package:taxi/utills/components/yellow_button.dart';

import '../../../utills/components/text_widget.dart';
import '../../../utills/controller/theme_controller/theme.dart';

class ForgetPasswordOtp extends StatefulWidget {
  const ForgetPasswordOtp({super.key});

  @override
  State<ForgetPasswordOtp> createState() => _SignupView3State();
}

class _SignupView3State extends State<ForgetPasswordOtp> {
  final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());
  final List<TextEditingController> _controllers =
  List.generate(5, (_) => TextEditingController());

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

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
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: GoogleFonts.poppins(fontSize: height * 0.03),
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 4) {
            FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
          }
          if (value.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
          }
        },
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
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )),
              SizedBox(
                height: 10,
              ),
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
                    5, (index) => buildOTPField(index, height, width)),
              ),
              SizedBox(
                height: 25,
              ),
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
                        ),
                      ])),
              SizedBox(height: 250,),
              YellowButton(buttonText: 'Verify', ontap: (){})
            ],
          ),
        ),
      ),
    );
  }
}
