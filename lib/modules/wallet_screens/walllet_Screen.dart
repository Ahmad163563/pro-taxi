import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/utills/components/text_widget.dart';
import 'package:taxi/utills/components/yellow_button.dart';

class WallletScreen extends StatefulWidget {
  const WallletScreen({super.key});

  @override
  State<WallletScreen> createState() => _WallletScreenState();
}

class _WallletScreenState extends State<WallletScreen> {
  final List<Map<String, String>> items = [
    {"title": "Welton", "subtitle": "Today at 09.20 am", "action": "\$570"},
    {"title": "Natson", "subtitle": "Today at 01.10 am", "action": "\$400"},
    {"title": "Alex", "subtitle": "Today at 02.40 am", "action": "\$970"},
    {"title": "John", "subtitle": "Today at 04.00 am", "action": "\$270"},
    {"title": "Carter", "subtitle": "Today at 05.20 am", "action": "\$670"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    height: 45,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xfff8c20d)),
                    ),
                    child: Center(
                      child:  GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreenss()));
                        },
                        child: CustomText(
                          label: 'Add Money',
                          size: TextSize.small,
                          weight: FontWeight.w400,
                          fontType: GoogleFonts.poppins,
                          color: const Color(0xfff8c20d),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _balanceCard("500\$", "Available Balance"),
                _balanceCard("200\$", "Total Expand"),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                SizedBox(width: 8,),
                CustomText(
                  label: 'Transaction',
                  size: TextSize.large,
                  weight: FontWeight.w500,
                  fontType: GoogleFonts.poppins,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: (){},
                    child: CustomText(
                      label: 'See All',
                      size: TextSize.small,
                      weight: FontWeight.w400,
                      fontType: GoogleFonts.poppins,
                      color: const Color(0xfff8c20d),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 👇 Expanded lagaya for ListView
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,),
                    ),
                    child: ListTile(
                      leading:Image.asset('assets/paypal.png'),
                      title: Text(
                        items[index]["title"]!,
                        style: const TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        items[index]["subtitle"]!,
                        style: const TextStyle(color: Colors.black),
                      ),
                      trailing: Text(
                        items[index]["action"]!,
                        style: const TextStyle(color: Colors.black,fontSize: 15),
                      ),
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Reusable card widget
  Widget _balanceCard(String amount, String label) {
    return Container(
      height: 80,
      width: 160,
      decoration: BoxDecoration(
        color: const Color(0xffFFE8D2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xfff8c20d)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomText(
            label: amount,
            size: TextSize.medium,
            weight: FontWeight.w600,
            fontType: GoogleFonts.poppins,
            color: Colors.black,
          ),
          CustomText(
            label: label,
            size: TextSize.small,
            weight: FontWeight.w400,
            fontType: GoogleFonts.poppins,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}





class PaymentScreenss extends StatefulWidget {
  const PaymentScreenss({super.key});

  @override
  State<PaymentScreenss> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreenss> {
  final List<Map<String, String>> items = [
    {"title": "Welton", "subtitle": "Today at 09.20 am", "action": "\$570"},
    {"title": "Natson", "subtitle": "Today at 01.10 am", "action": "\$400"},
    {"title": "Alex", "subtitle": "Today at 02.40 am", "action": "\$970"},
    {"title": "John", "subtitle": "Today at 04.00 am", "action": "\$270"},
    {"title": "Carter", "subtitle": "Today at 05.20 am", "action": "\$670"},
  ];
  final _paymentController = TextEditingController();
  final _accountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Amount"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Select Payment Method
            TextFormField(
              controller: _paymentController,
              decoration: InputDecoration(
                labelText: "Select Payment Method",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),

            /// Account Number
            TextFormField(
              controller: _accountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Account Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 30),
            YellowButton(buttonText: 'Save Payment', ontap:() {
      _showSuccessSheet(context);
      },),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,),
                    ),
                    child: ListTile(
                      leading:Image.asset('assets/paypal.png'),
                      title: Text(
                        items[index]["title"]!,
                        style: const TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        items[index]["subtitle"]!,
                        style: const TextStyle(color: Colors.black),
                      ),
                      trailing: Text(
                        items[index]["action"]!,
                        style: const TextStyle(color: Colors.black,fontSize: 15),
                      ),
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ Bottom Sheet function
  void _showSuccessSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 80),
              SizedBox(height: 10),
              Text(
                "Add Success",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.white,),
              ),
              SizedBox(height: 6),
              CustomText(label: 'Your money has bee successfully add', size: TextSize.minismall, weight: FontWeight.w300, fontType: GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.white,),
              SizedBox(height: 6,),
              Text(
                "\$450",
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.w600, color: Colors.amber),
              ),
              SizedBox(height: 20),
              YellowButton(buttonText: "Back Home", ontap: () {
                Navigator.pop(context);
              },
              )
            ],
          ),
        );
      },
    );
  }
}
