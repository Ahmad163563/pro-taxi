import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/modules/transport_selection/confirm_ride.dart';
import 'package:taxi/utills/components/yellow_button.dart';

import '../../utills/components/text_widget.dart';
import '../../utills/controller/theme_controller/theme.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
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
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 8,),
                  CustomText(label: 'Select payment method', size: TextSize.extralarge, weight: FontWeight.w600, fontType: GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,),
                ],
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  SizedBox(width: 8,),
                  CustomText(label: 'Select payment you want to use', size: TextSize.medium, weight: FontWeight.w400, fontType: GoogleFonts.poppins,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,),
                ],
              ),
              SizedBox(height: 60,),
              paymentTile(
                0,
                "Visa",
                "**** **** **** 8970",
                "Exp: 12/25",
                "https://upload.wikimedia.org/wikipedia/commons/4/41/Visa_Logo.png",
              ),
              paymentTile(
                1,
                "Mastercard",
                "**** **** **** 5623",
                "Exp: 10/24",
                "assets/money.png",
              ),
              paymentTile(
                2,
                "Stripe",
                "Connected",
                "",
                "assets/arrow.png",
              ),
              paymentTile(
                3,
                "PayPal",
                "Connected",
                "",
                "assets/paypal.png",
              ),
              paymentTile(
                4,
                "Google Pay",
                "Connected",
                "",
                "assets/business.png",
              ),
              paymentTile(
                5,
                "PhonePe",
                "Connected",
                "",
                "online-payment.png",
              ),
              SizedBox(height: 20),
              YellowButton(buttonText: 'Confirm Ride', ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmRide()));
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentTile(
      int index, String title, String number, String sub, String imageUrl) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPayment = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
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
            Image.network(
              imageUrl,
              width: 40,
              height: 40,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.credit_card, size: 40, color: Colors.black54);
              },
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.black)),
                  Text(number,
                      style: GoogleFonts.poppins(
                          fontSize: 13, color: Colors.black)),
                  if (sub.isNotEmpty)
                    Text(sub,
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Colors.black)),
                ],
              ),
            ),
            if (selectedPayment == index)
              const Icon(Icons.check_circle, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
