import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/utills/components/text_widget.dart';

import '../../utills/controller/theme_controller/theme.dart';


class CancelOrderScreen extends StatefulWidget {
  @override
  State<CancelOrderScreen> createState() => _CancelTaxiScreenState();
}

class _CancelTaxiScreenState extends State<CancelOrderScreen> {
  int? selectedIndex;

  List<String> reasons = [
    "Waiting for long time",
    "Unable to contact driver",
    "Driver denied to go to destination",
    "Driver denied to come to pickup",
    "Wrong address shown",
    "The price is not reasonable",
  ];

  void _showCancelDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Emoji
                Text("😓", style: TextStyle(fontSize: 50)),

                SizedBox(height: 16),
                CustomText(label: "We're so sad about your cancellation", size: TextSize.large, weight: FontWeight.w600, fontType: GoogleFonts.poppins,),

                SizedBox(height: 8),
                CustomText(label: 'We will continue to improve our service & satisfy you on the next trip', size: TextSize.small, weight: FontWeight.w300, fontType: GoogleFonts.poppins),

                SizedBox(height: 20),

                // Back Home Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close dialog
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text("Back Home",
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black
          : Colors.white,
      appBar: AppBar(
        leading: Padding(
        padding: const EdgeInsets.only(left: 10,top: 18),
    child: CustomText(label: 'Back', size: TextSize.small, weight: FontWeight.w400, fontType:   GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
    ? Colors.grey
        : Colors.black,),),
        title: CustomText(label: 'Cancel Taxi', size: TextSize.large, weight: FontWeight.w600, fontType: GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,),
        centerTitle: true,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Please select the reason of cancellation.",
                style: GoogleFonts.poppins(
                    fontSize: 14, color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey
                    : Colors.black),
              ),
            ),
            SizedBox(height: 20),

            // Selectable List
            Expanded(
              child: ListView.builder(
                itemCount: reasons.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 12),
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedIndex == index
                              ? Colors.orange
                              : Colors.grey.shade300,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.black
                            : Colors.white
                      ),
                      child: Row(
                        children: [
                          Icon(
                            selectedIndex == index
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                            color: selectedIndex == index
                                ? Colors.orange
                                : Colors.grey,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              reasons[index],
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedIndex != null ? _showCancelDialog : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  selectedIndex != null ? Colors.orange : Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text("Submit",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w600,color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
