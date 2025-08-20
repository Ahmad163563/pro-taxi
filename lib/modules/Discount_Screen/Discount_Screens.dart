import 'package:flutter/material.dart';
import 'package:taxi/utills/components/yellow_button.dart';

class DiscountScreen extends StatelessWidget {
  final List<Map<String, dynamic>> offers = [
    {
      "icon": Icons.shopping_bag,
      "color": Colors.red,
      "title": "Discount 15% off",
      "subtitle": "Special promo valid for Black Friday",
    },
    {
      "icon": Icons.shopping_bag,
      "color": Colors.green,
      "title": "Special 5% off",
      "subtitle": "Valid for selected items",
    },
    {
      "icon": Icons.shopping_bag,
      "color": Colors.blue,
      "title": "Cashback 15%",
      "subtitle": "On all transactions",
    },
    {
      "icon": Icons.shopping_bag,
      "color": Colors.pink,
      "title": "Special 15% off",
      "subtitle": "Limited time offer",
    },
    {
      "icon": Icons.shopping_bag,
      "color": Colors.purple,
      "title": "Discount 15% off",
      "subtitle": "Exclusive online deal",
    },
    {
      "icon": Icons.shopping_bag,
      "color": Colors.teal,
      "title": "Discount 15% off",
      "subtitle": "Special new arrivals",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Special Offer",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: offers.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.orange.shade200),
              color: Colors.orange.shade50,
            ),
            child: GestureDetector(
              onTap: (){
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) => OfferBottomSheet(),
                  );
                  },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: offers[index]["color"].withOpacity(0.1),
                  child: Icon(
                    offers[index]["icon"],
                    color: offers[index]["color"],
                  ),
                ),
                title: Text(
                  offers[index]["title"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(offers[index]["subtitle"]),
              ),
            ),
          );
        },
      ),
    );
  }
}


class OfferBottomSheet extends StatelessWidget {
  const OfferBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Spacer(),
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.close,color: Colors.black,))
              ],
            ),
            /// 🔹 Title
            Text(
              "🎉 Special Offer 🎉",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            SizedBox(height: 20),

            /// 🔹 Discount Image & Logo
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(
                    "assets/15.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),

            /// 🔹 Discount Text
            Text(
              "15% OFF",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 10),

            /// 🔹 Terms & Conditions Heading
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Terms & Conditions",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 8),

            /// 🔹 Terms & Conditions Content
            Text(
              """1. Offer valid for a limited time only.  
2. Applicable on selected items.  
3. Cannot be combined with other discounts.  
4. Company reserves the right to change or cancel the offer.  
5. Discount not applicable on delivery charges.  
6. One offer per customer.  
7. Misuse of offer may lead to cancellation.  
8. For more details contact our support team.""",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),
            YellowButton(buttonText: 'Use promo', ontap: (){})
          ],
        ),
      ),
    );
  }
}
