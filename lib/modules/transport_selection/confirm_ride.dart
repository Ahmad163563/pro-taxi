import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/utills/components/text_widget.dart';
import 'package:taxi/utills/components/yellow_button.dart';

import '../../utills/controller/theme_controller/theme.dart';

class ConfirmRide extends StatefulWidget {
  const ConfirmRide({super.key});

  @override
  State<ConfirmRide> createState() => _ConfirmRideState();
}

class _ConfirmRideState extends State<ConfirmRide> {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black
          : Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10,top: 18),
          child: CustomText(label: 'Back', size: TextSize.small, weight: FontWeight.w400, fontType:   GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey
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
      body: Column(
        children: [
          SizedBox(height: 60,),
          Center(
            child: Image.asset('assets/9135401.png',height: 200,width: 300,),
          ),
          CustomText(label: 'Thank you', size: TextSize.extralarge, weight: FontWeight.w600, fontType: GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,),
          SizedBox(height: 8,),
          CustomText(label: 'Your booking has been placed send to\n                   Md. Shareef Ahmad', size: TextSize.medium, weight: FontWeight.w400, fontType: GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey
              : Colors.black,),
            SizedBox(height: 100,),
          YellowButton(buttonText: 'Confirm Ride', ontap: (){})
        ],
      ),
    );
  }
}
