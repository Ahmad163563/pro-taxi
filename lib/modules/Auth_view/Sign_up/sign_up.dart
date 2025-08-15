import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/utills/app_constant/app_color.dart';
import 'package:taxi/utills/components/text_widget.dart';
import 'package:taxi/utills/components/textformfield.dart';
import 'package:taxi/utills/components/white-text.dart';

import '../../../utills/controller/theme_controller/theme.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? selectedGender;
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
              ? Colors.white
              : Colors.black,),
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
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 15,),
              CustomText(
                label: 'Sign Up',
                size: TextSize.large,
                weight: FontWeight.bold,
                fontType: GoogleFonts.poppins,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            ],
          ),
          SizedBox(height: 10,),
          textFormField(hintText: 'Name'),
          SizedBox(height: 15,),
          textFormField(hintText: 'Email'),
          SizedBox(height: 15,),
          textFormField(hintText: '+880 Your Mobile Number'),
         SizedBox(height: 15,),
    DropdownButtonFormField<String>(
    value: selectedGender,
    decoration: InputDecoration(
      hintText: 'Gender',
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    ),
    icon: const Icon(Icons.arrow_drop_down), // arrow icon
    items: ["Male", "Female"].map((gender) {
    return DropdownMenuItem(
    value: gender,
    child: Text(gender),
    );
    }).toList(),
    onChanged: (value) {
    setState(() {
    selectedGender = value;
    });
    },
    validator: (value) {
    if (value == null || value.isEmpty) {
    return "Please select gender";
    }
    })]
          ))
    );
  }
}
