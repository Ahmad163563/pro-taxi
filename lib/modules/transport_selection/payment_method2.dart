import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/utills/components/yellow_button.dart';

import '../../utills/components/text_widget.dart';
import '../../utills/controller/theme_controller/theme.dart';

class PaymentSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 18),
          child: CustomText(
            label: 'Back',
            size: TextSize.small,
            weight: FontWeight.w400,
            fontType: GoogleFonts.poppins,
            color: Theme
                .of(context)
                .brightness == Brightness.dark
                ? Colors.grey
                : Colors.black,
          ),
        ),
        title: CustomText(
          label: 'Payment',
          size: TextSize.large,
          weight: FontWeight.w600,
          fontType: GoogleFonts.poppins,
          color: Theme
              .of(context)
              .brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        centerTitle: true,
        actions: [
          Obx(() =>
              IconButton(
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Car info
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .brightness == Brightness.dark
                      ? Colors.black
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xfff8c20d))),
              child: Row(
                children: [
                  Image.asset(
                    "assets/mustang.png", // ✅ network nahi, asset use karna hai
                    height: 60,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          label: 'Mustang Shelby GT',
                          size: TextSize.small,
                          weight: FontWeight.bold,
                          fontType: GoogleFonts.poppins,
                          color: Theme
                              .of(context)
                              .brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            SizedBox(width: 5),
                            Text("4.9 (531 reviews)",
                                style: TextStyle(color: Colors.grey[400])),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 12),
            CustomText(
              label: 'Charge',
              size: TextSize.medium,
              weight: FontWeight.w400,
              fontType: GoogleFonts.poppins,
              color: Theme
                  .of(context)
                  .brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
            SizedBox(height: 20),

            /// Charges
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .brightness == Brightness.dark
                    ? Colors.black
                    : Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  rowText(context, "Mustang (per hour)", "\$200"),
                  rowText(context, "Vat (5%)", "\$20"),
                  rowText(context, "Promo Code", "-\$5"),
                  Divider(color: Colors.grey),
                  rowText(context, "Total", "\$215", bold: true),
                ],
              ),
            ),
            SizedBox(height: 20),

            /// Payment methods
            Text("Select payment method",
                style: TextStyle(color: Colors.white, fontSize: 16)),
            SizedBox(height: 10),
            paymentMethod(context, Icons.credit_card, "**** **** **** 8970"),
            paymentMethod(context, Icons.credit_card, "**** **** **** 6970"),
            paymentMethod(context, Icons.email, "mailaddress@gmail.com"),
            paymentMethod(context, Icons.money, "Cash"),

            SizedBox(height: 30),
            YellowButton(buttonText: 'Confirm Ride', ontap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => PaymentSuccessScreen()));
            })
          ],
        ),
      ),
    );
  }

  Widget rowText(BuildContext context, String left, String right,
      {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            left,
            style: TextStyle(
              color: Theme
                  .of(context)
                  .brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            right,
            style: TextStyle(
              color: Theme
                  .of(context)
                  .brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentMethod(BuildContext context, IconData icon, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .brightness == Brightness.dark
            ? Colors.white
            : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xfff8c20d))
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.amber),
          SizedBox(width: 12),
          Expanded(
            child: SelectableText(
              text,
              style: TextStyle(
                color: Theme
                    .of(context)
                    .brightness == Brightness.dark
                    ? Colors.black
                    : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class PaymentSuccessScreen extends StatelessWidget {
  void _showFeedbackSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return FeedbackSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.7), // ✅ overlay feel
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.greenAccent, size: 100),
              SizedBox(height: 20),
              Text(
                "Payment Success",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Your money has been successfully sent.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[400]),
              ),
              SizedBox(height: 30),
              Text(
                "\$215",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
              SizedBox(height: 30),

              /// ✅ Feedback Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  _showFeedbackSheet(context); // ✅ open feedback bottomsheet
                },
                child: Text("Provide Feedback",
                    style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 12),

              /// ✅ Done Button
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: BorderSide(color: Colors.white),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Done"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ---------------- FEEDBACK SHEET ----------------
class FeedbackSheet extends StatefulWidget {
  @override
  _FeedbackSheetState createState() => _FeedbackSheetState();
}

class _FeedbackSheetState extends State<FeedbackSheet> {
  int rating = 5;
  int? selectedTip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Rate your trip",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),),
          SizedBox(height: 15),

          /// Stars
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                onPressed: () {
                  setState(() {
                    rating = index + 1;
                  });
                },
                icon: Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 32,
                ),
              );
            }),
          ),
          Text(
            rating >= 4 ? "Excellent" : rating == 3 ? "Good" : "Bad",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black),
          ),

          SizedBox(height: 20),
          Text("Give some tips",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,)),
          SizedBox(height: 10),

          /// Tip options
          Wrap(
            spacing: 12,
            children: [1, 2, 5, 10, 20].map((amount) {
              return ChoiceChip(
                label: Text("\$$amount"),
                selected: selectedTip == amount,
                selectedColor: Colors.amber,
                onSelected: (val) {
                  setState(() {
                    selectedTip = amount;
                  });
                },
              );
            }).toList(),
          ),

          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: EdgeInsets.all(14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {
                Navigator.pop(context); // close feedback sheet
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) => ThankYouSheet(),
                );
              },
              child: Text("Submit",
                  style: TextStyle(color: Colors.black, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}

/// ---------------- THANK YOU SHEET ----------------
class ThankYouSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 80),
          SizedBox(height: 15),
          Text("Thank you",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(
            "Thank you for your valuable feedback and tip",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600]),
          ),
          SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: EdgeInsets.all(14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {
                Navigator.pop(context); // close thank you sheet
                Navigator.pop(context); // back to success screen
              },
              child: Text("Back Home",
                  style: TextStyle(color: Colors.black, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}