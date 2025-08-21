import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utills/components/text_widget.dart';
import '../../utills/controller/theme_controller/theme.dart';
import '../drawer/drawer.dart';
import '../faviorite_screen]/favorite_screen.dart';
import '../transport_selection/transport selection.dart';
import '../wallet_screens/walllet_Screen.dart';

class GoogleLocation extends StatelessWidget {
  const GoogleLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GoogleLocationController()); // Inject Controller
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                    color: const Color(0xfff8c20d),
                  ),
                  child: const Icon(Icons.search, color: Colors.black),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 25,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: const Color(0xfff8c20d),
                  ),
                  child: const Icon(Icons.notifications, color: Colors.black),
                ),
              ),
              Obx(() => IconButton(
                onPressed: () => themeController.toggleTheme(),
                icon: Icon(themeController.isDark.value
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined),
              ))
            ],
          )
        ],
      ),
      drawer: const ProfileDrawer(),

      // 🔹 IndexedStack ko reactive banate hain
      body: Obx(() => IndexedStack(
        index: controller.currentIndex.value,
        children: [
          _buildHomeScreen(controller, context),
          Center(child: FavoriteScreen()),
          const Center(child: WallletScreen()),
          const Center(child: Text("👤 Profile")),
          const Center(child: Text("Offer")),
        ],
      )),

      // 🔹 Bottom Navigation
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.changeIndex,
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
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
        ],
      )),
    );
  }

  // 🔹 Home Screen widget
  Widget _buildHomeScreen(GoogleLocationController controller, BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset("assets/location.jpg", fit: BoxFit.cover),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xfff8c20d),
                      ),
                      child: const Center(child: Text("Rental")),
                    ),
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
                      child: const Icon(Icons.my_location, color: Colors.white),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),

              // 🔹 Search & Chips Container
              Container(
                height: 150,
                width: 420,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
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
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.black54
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () => openAddressBottomSheet(context, controller),
                              icon: const Icon(Icons.search, color: Colors.grey)),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Where would you go?",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const Icon(Icons.favorite_border, color: Colors.grey),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),

                    // 🔹 Chips Row (Reactive)
                    Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSelectableChip("Transport", controller),
                        _buildSelectableChip("Delivery", controller),
                      ],
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSelectableChip(String label, GoogleLocationController controller) {
    final isSelected = controller.selectedOption.value == label;
    return GestureDetector(
      onTap: () => controller.changeOption(label),
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



void openAddressBottomSheet(BuildContext context, GoogleLocationController controller) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
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
                    bottom: MediaQuery.of(context).viewInsets.bottom + 12,
                    top: 12,
                  ),
                  child: Form(
                      key: controller.formKey,
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
                    controller: controller.nameController,
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
                    controller: controller.addressController,
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>TransportSelection()));
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





class GoogleLocationController extends GetxController {
  // 🔹 Bottom navigation index
  var currentIndex = 0.obs;

  // 🔹 Selected Chip Option
  var selectedOption = "Transport".obs;

  // 🔹 TextControllers for BottomSheet
  final nameController = TextEditingController();
  final addressController = TextEditingController();

  // 🔹 Form Key
  final formKey = GlobalKey<FormState>();

  // 🔹 Function: change bottom navigation index
  void changeIndex(int index) {
    currentIndex.value = index;
  }

  // 🔹 Function: change selected chip
  void changeOption(String label) {
    selectedOption.value = label;
  }

  @override
  void onClose() {
    nameController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
