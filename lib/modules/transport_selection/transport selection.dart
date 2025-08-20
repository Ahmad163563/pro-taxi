import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/modules/transport_selection/available_transport2.dart';
import 'package:taxi/utills/components/text_widget.dart';

import '../../utills/controller/theme_controller/theme.dart';

class TransportSelection extends StatefulWidget {
  @override
  _TransportSelectionScreenState createState() =>
      _TransportSelectionScreenState();
}

class _TransportSelectionScreenState extends State<TransportSelection> {
  int? selectedIndex; // null means nothing selected

  final List<Map<String, String>> transports = [
    {"title": "Car", "image": "https://cdn-icons-png.flaticon.com/512/2330/2330453.png"},
    {"title": "Bike", "image": "https://cdn-icons-png.flaticon.com/512/6750/6750554.png"},
    {"title": "Cycle", "image": "assets/bicycle.png"},
    {"title": "Taxi", "image": "assets/taxi.png"},
  ];

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
        title: CustomText(label: 'Select Transport', size: TextSize.small, weight: FontWeight.w400, fontType: GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
           Text(
            "Select your transport",
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemCount: transports.length,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AvailableTransport2()));// setState(() {
                    //   selectedIndex = index;
                    // });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.yellow.shade200 // selected -> light yellow
                          : Colors.black54, // default -> light black
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.orange
                            : Colors.orangeAccent,
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          transports[index]["image"]!,
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          transports[index]["title"]!,
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
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