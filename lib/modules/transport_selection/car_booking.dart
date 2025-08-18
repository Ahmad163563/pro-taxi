import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/utills/components/text_widget.dart';
import 'package:taxi/utills/components/textformfield.dart';
import 'package:taxi/utills/components/yellow_button.dart';

import '../../utills/controller/theme_controller/theme.dart';

class CarBookingScreen extends StatefulWidget {
  const CarBookingScreen({super.key});

  @override
  State<CarBookingScreen> createState() => _CarBookingScreenState();
}

class _CarBookingScreenState extends State<CarBookingScreen> {
  int selectedPayment = 0;

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
        title: CustomText(label: 'Request for rent', size: TextSize.large, weight: FontWeight.w600, fontType: GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Current Location
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.red),
                  SizedBox(width: 8),
                  Expanded(
                    child: CustomText(label: 'Current Location\n '
                        '2972 santhemier Rd. santa', size: TextSize.small, weight: FontWeight.w400, fontType: GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey
                        : Colors.black,)
                  ),
                ],
              ),
              SizedBox(height: 12),

              // Office Location
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.orange),
                  SizedBox(width: 8),
                  Expanded(
                    child: CustomText(label: 'Office\n '
                        '1901 thoringe cir', size: TextSize.small, weight: FontWeight.w400, fontType: GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey
                        : Colors.black,)
                  ),
                  CustomText(label: '1.8Km', size: TextSize.minismall, weight: FontWeight.w100, fontType: GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey
                      : Colors.black,)
                ],
              ),
              SizedBox(height: 16),

              // Car Info Container
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.black
                        : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xfff8c20d))
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(label: 'Mushtang shelby GT', size: TextSize.medium, weight: FontWeight.w600, fontType: GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 18),
                              CustomText(label: '4.9 (531 reviews) ', size: TextSize.small, weight: FontWeight.w200, fontType: GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
                                  ? Colors.grey
                                  : Colors.black,)
                            ],
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        "assets/mustang.png",
                        width: 100,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Date & Time
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Date",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Time",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Promo Code
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Promo Code",
                  suffixIcon: Icon(Icons.copy),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Payment Method
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(label: 'Select payment method', size: TextSize.medium, weight: FontWeight.w600, fontType: GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,),
                  GestureDetector(
                      onTap: (){},
                      child: CustomText(label: 'View All', size: TextSize.small, weight: FontWeight.w400, fontType: GoogleFonts.poppins,color: Colors.orange,))
                ],
              ),
              SizedBox(height: 12),

              paymentTile(0, "Visa", "**** **** **** 8970", "Exp: 12/25",
                  Icons.credit_card,),
              paymentTile(1, "Mastercard", "**** **** **** 5623", "Exp: 10/24",
                  Icons.credit_card),
              paymentTile(
                  2, "Stripe", "Connected", "", Icons.payment_outlined),
              SizedBox(height: 30),
            YellowButton(buttonText: 'Confirm Booking', ontap: (){})
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentTile(
      int index, String title, String number, String sub, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPayment = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: selectedPayment == index
              ? Colors.orange.shade50
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selectedPayment == index ? Colors.orange : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black54, size: 30),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 15,color: Colors.black)),
                  Text(number, style: GoogleFonts.poppins(fontSize: 13,color: Colors.black)),
                  if (sub.isNotEmpty)
                    Text(sub, style: GoogleFonts.poppins(fontSize: 12,color: Colors.black)),
                ],
              ),
            ),
            if (selectedPayment == index)
              Icon(Icons.check_circle, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
