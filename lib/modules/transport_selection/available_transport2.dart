import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/modules/transport_selection/car_details3.dart';
import 'package:taxi/utills/components/text_widget.dart';

import '../../utills/controller/theme_controller/theme.dart';

class AvailableTransport2 extends StatefulWidget {
  @override
  _CarListScreenState createState() => _CarListScreenState();
}

class _CarListScreenState extends State<AvailableTransport2> {
  int? expandedIndex;
  Map<int, String> selectedOptions = {};

  final List<Map<String, String>> cars = [
    {
      "name": "BMW Cabrio",
      "details": "Automatic | 3 seats | Octane",
      "distance": "800m (5 mins away)",
      "image":
      "https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=800"
    },
    {
      "name": "Mustang Shelby GT",
      "details": "Automatic | 3 seats | Octane",
      "distance": "900m (5 mins away)",
      "image":
      "https://images.unsplash.com/photo-1502877338535-766e1452684a?w=800"
    },
    {
      "name": "BMW i8",
      "details": "Automatic | 3 seats | Octane",
      "distance": "850m (5 mins away)",
      "image":
      "https://images.unsplash.com/photo-1525609004556-c46c7d6cf023?w=800"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      backgroundColor:Theme.of(context).brightness == Brightness.dark
          ? Colors.black
          : Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : Colors.white,
        title: CustomText(
          label: 'Back',
          size: TextSize.small,
          weight: FontWeight.w300,
          fontType: GoogleFonts.poppins,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          // --- TOP HEADING ---
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomText(label: 'Available cars for ride', size: TextSize.large, weight: FontWeight.w600, fontType: GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,)
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: CustomText(label: '18 cars found', size: TextSize.small, weight: FontWeight.w300, fontType: GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,)
          ),

          const SizedBox(height: 10),

          // --- CAR LIST ---
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cars.length,
              itemBuilder: (context, index) {
                final isExpanded = expandedIndex == index;
                final selected =
                selectedOptions[index]; // Book later / Ride Now

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.black
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.orange, width: 1),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.network(
                          cars[index]["image"]!,
                          width: 60,
                          height: 40,
                        ),
                        title: Text(
                          cars[index]["name"]!,
                          style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          "${cars[index]["details"]}\n${cars[index]["distance"]}",
                          style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.grey
                                : Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Buttons
                      if (!isExpanded)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              expandedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                bottom: 16, left: 16, right: 16),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border:
                              Border.all(color: Colors.orange, width: 1.5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                "View car list",
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 14),
                              ),
                            ),
                          ),
                        )
                      else
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedOptions[index] = "Book later";
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 12),
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    color: selected == "Book later"
                                        ? Colors.orange
                                        : Colors.orange.shade200,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Book later",
                                      style: TextStyle(
                                        color: selected == "Book later"
                                            ? Colors.black
                                            : Colors.grey.shade900,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedOptions[index] = "Ride Now";
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 12),
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    color: selected == "Ride Now"
                                        ? Colors.orange
                                        : Colors.orange.shade200,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap:(){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CarDetailsScreen()));
                                      },
                                      child: Text(
                                        "Ride Now",
                                        style: TextStyle(
                                          color: selected == "Ride Now"
                                              ? Colors.black
                                              : Colors.grey.shade900,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}