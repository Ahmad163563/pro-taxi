import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/utills/components/text_widget.dart';
import 'package:taxi/utills/components/yellow_button.dart';

import '../utills/controller/theme_controller/theme.dart';

class Referral extends StatefulWidget {
  const Referral({super.key});

  @override
  State<Referral> createState() => _ReferralState();
}

class _ReferralState extends State<Referral> {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: Text(
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
        title: CustomText(label: 'Referral', size: TextSize.large, weight: FontWeight.w600, fontType:GoogleFonts.poppins,color:  Theme.of(context).brightness == Brightness.dark
            ? Colors.grey
            : Colors.black,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 8,),
              CustomText(label: 'Refer a freind and earn 20\$', size: TextSize.small, weight: FontWeight.w400, fontType: GoogleFonts.poppins,color:  Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey
                  : Colors.grey,),
            ],
          ),
          SizedBox(height: 10,),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'RMK2334',
              suffixIcon: Icon(Icons.copy)
            ),
          ),
          SizedBox(height: 20,),
          YellowButton(buttonText: 'Invite', ontap: (){})
        ],
      ),
    );
  }
}
