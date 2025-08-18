import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/utills/app_constant/app_color.dart';
import 'package:taxi/utills/components/text_widget.dart';

import '../../utills/controller/theme_controller/theme.dart';

class GoogleLocation extends StatefulWidget {
  const GoogleLocation({super.key});

  @override
  State<GoogleLocation> createState() => _LState();
}

class _LState extends State<GoogleLocation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Center(child: Text(" Home Screen")),
    Center(child: Text(" Favorites")),
    Center(child: Text(" Wallet")),
    Center(child: Text(" Profile")),
    Center(child: Text(" offer")),
  ];

  String selectedOption = "Transport";

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final ThemeController themeController = Get.find();
    return Scaffold(
      extendBodyBehindAppBar: true, // 👈 important
      appBar: AppBar(
        backgroundColor: Colors.transparent, // 👈 transparent appbar
        elevation: 0,
        title: GestureDetector(
          onTap: () {},
          child: Container(
            height: 25,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Color(0xfff8c20d),
            ),
            child: Icon(
              Icons.menu,
              color: AppColors.blackColor,
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 25,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Color(0xfff8c20d),
                  ),
                  child: Icon(
                    Icons.search,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 25,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Color(0xfff8c20d),
                  ),
                  child: Icon(
                    Icons.notifications,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
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
          )
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // Screen 1 (Home with background + chips)
          Stack(
            children: [
              // 🔹 Full screen background image
              Positioned.fill(
                child: Image.asset(
                  "assets/location.jpg", // apni image ka path
                  fit: BoxFit.cover,
                ),
              ),

              // 🔹 Overlay with gradient
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),

              // 🔹 Text and container on top
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 12),
                        Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xfff8c20d),
                          ),
                          child: const Center(child: Text("Rental")),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: const Icon(Icons.my_location,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),

                    // 🔹 Main container with search + selectable chips
                    Container(
                      height: 150,
                      width: 420,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme
                            .of(context)
                            .brightness == Brightness.dark
                            ? Colors.black54
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // 🔹 Search bar
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Theme
                                  .of(context)
                                  .brightness ==
                                  Brightness.dark
                                  ? Colors.black54
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Row(
                              children: [
                                IconButton(onPressed:() => openAddressBottomSheet(context), icon: Icon(Icons.search,color: Colors.grey,)),
                                const SizedBox(width: 8),
                                const Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Where would you go?",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                const Icon(Icons.favorite_border,
                                    color: Colors.grey),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),

                          // 🔹 Selectable Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildSelectableChip("Transport"),
                              _buildSelectableChip("Delivery"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Screen 2
          Center(child: Text("❤️ Favorites")),

          // Screen 3
          Center(child: Text("💳 Wallet")),

          // Screen 4
          Center(child: Text("👤 Profile")),
        ],
      ),
      // 🔹 Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), label: "Wallet"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer), label: 'Offer'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildSelectableChip(String label) {
    final isSelected = selectedOption == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.amber : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.grey,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}



void openAddressBottomSheet(BuildContext context) {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // keyboard ke liye
    backgroundColor: Colors.transparent, // rounded corners dikhane ke liye
    builder: (ctx) {
      return DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  // keyboard overlap handle
                  bottom: MediaQuery
                      .of(context)
                      .viewInsets
                      .bottom + 12,
                  top: 12,
                ),
                child: Form(
                  key: formKey,
                  child: ListView(
                    controller: scrollController,
                    children: [
                      // --- Top handle (optional) ---
                      Center(
                        child: Container(
                          width: 40, height: 4,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      // --- Top Text: Select Address ---
                      Row(
                          children: [
                            Icon(Icons.location_on_outlined, color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey
                          : Colors.black87,),
                            SizedBox(width: 8),
                            CustomText(label: 'Select Address',
                                size: TextSize.large,
                                weight: FontWeight.w700,
                                fontType: GoogleFonts.poppins,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Colors.grey
                                  : Colors.black87,)
                          ]
                      ),
                  const SizedBox(height: 12),
                  const Divider(),

                  // --- TextFormField #1 ---
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: nameController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Form',
                      prefixIcon: Icon(Icons.my_location),
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) =>
                    (v == null || v
                        .trim()
                        .isEmpty)
                        ? 'To' : null,
                  ),

                  // --- TextFormField #2 ---
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: addressController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      hintText: 'To',
                      prefixIcon: Icon(Icons.location_on_outlined),
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) =>
                    (v == null || v
                        .trim()
                        .isEmpty)
                        ? 'Enter your address' : null,
                  ),

                  // Actions row (optional)
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.my_location_outlined),
                          label: const Text('Use current location'),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: FilledButton.icon(
                          icon: const Icon(Icons.save_outlined),
                          label: const Text('Save'),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.pop(context, {
                                'name': nameController.text.trim(),
                                'address': addressController.text.trim(),
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12),
                  Divider(),

                  // --- Text (below second divider) ---
                  SizedBox(height: 8),
                  CustomText(label: 'Recent Place',
                      size: TextSize.medium,
                      weight: FontWeight.w600,
                      fontType: GoogleFonts.poppins),

                  SizedBox(height: 8),
                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.location_on),
                      ),
                      title: CustomText(label: 'Office',
                          size: TextSize.small,
                          weight: FontWeight.w400,
                          fontType: GoogleFonts.poppins),
                      subtitle: const Text(
                          '2972 Westhiemer Rd. Santa Ana,85488'),
                      trailing: CustomText(label: '2.7Km',
                          size: TextSize.small,
                          weight: FontWeight.w400,
                          fontType: GoogleFonts.poppins),
                      onTap: () {
                        Navigator.pop(context, {
                        });
                      },
                    ),
                  ),

                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.location_on),
                      ),
                      title: const Text('Coffee Shop'),
                      subtitle: const Text('1908 thomridge ,lif'),
                      trailing: CustomText(label: '1.1Km',
                          size: TextSize.small,
                          weight: FontWeight.w400,
                          fontType: GoogleFonts.poppins),
                      onTap: () {
                        Navigator.pop(context, {
                        });
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.location_on),
                      ),
                      title: const Text('Shopping center'),
                      subtitle: const Text('4148, perker Rd, allentown'),
                      trailing: CustomText(label: '4.9Km',
                          size: TextSize.small,
                          weight: FontWeight.w400,
                          fontType: GoogleFonts.poppins),
                      onTap: () {
                        Navigator.pop(context, {
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
              ])
                ),
              ),
            ),
          );
        }
      );
    },
  );
}
