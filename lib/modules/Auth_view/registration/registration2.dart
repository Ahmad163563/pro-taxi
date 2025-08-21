import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi/modules/Auth_view/Sign_in/Sign_in.dart';
import 'package:taxi/utills/app_constant/app_color.dart';
import 'package:taxi/utills/components/text_widget.dart';
import 'package:taxi/utills/components/textformfield.dart';
import '../../../utills/controller/theme_controller/theme.dart';
import 'registration_controller.dart';

class Registration2 extends StatelessWidget {
  Registration2({super.key});

  final RegistrationController controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Back',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w100,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey
                : Colors.black,
          ),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: CustomText(
                  label: 'Profile',
                  size: TextSize.large,
                  weight: FontWeight.w800,
                  fontType: GoogleFonts.poppins,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey
                      : Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Obx(() => Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: controller.imageFile.value != null
                          ? FileImage(controller.imageFile.value!)
                          : const AssetImage('assets/chloe.jpg')
                      as ImageProvider,
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: controller.pickImage,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(2, 2),
                              )
                            ],
                          ),
                          padding: const EdgeInsets.all(6),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
              ),
              const SizedBox(height: 20),

              textFormField(
                  hintText: 'Full Name',
                  controller: controller.nameController,
                  validator: (v) => controller.validateField(v, "Name")),
              const SizedBox(height: 12),
              textFormField(
                  hintText: 'Enter phone number',
                  controller: controller.phoneController,
                  validator: (v) => controller.validateField(v, "Phone")),
              const SizedBox(height: 12),
              textFormField(
                  hintText: 'Email',
                  controller: controller.emailController,
                  validator: (v) => controller.validateField(v, "Email")),
              const SizedBox(height: 12),
              textFormField(
                  hintText: 'Street',
                  controller: controller.streetController,
                  validator: (v) => controller.validateField(v, "Street")),

              const SizedBox(height: 12),

              // City Dropdown
              Obx(() => DropdownButtonFormField<String>(
                value: controller.selectedCity.value.isEmpty
                    ? null
                    : controller.selectedCity.value,
                decoration: InputDecoration(
                  hintText: 'City',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                ),
                items: ["D.I.Khan", "Tank", "D.G.Khan"].map((city) {
                  return DropdownMenuItem(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.selectedCity.value = value!;
                },
              )),
              const SizedBox(height: 12),

              // District Dropdown
              Obx(() => DropdownButtonFormField<String>(
                value: controller.selectedDistrict.value.isEmpty
                    ? null
                    : controller.selectedDistrict.value,
                decoration: InputDecoration(
                  hintText: 'District',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                ),
                items: ["Panyala", "Hattala", "Paharpur"].map((district) {
                  return DropdownMenuItem(
                    value: district,
                    child: Text(district),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.selectedDistrict.value = value!;
                },
              )),
              const SizedBox(height: 20),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xfff8c20d))),
                    child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: CustomText(
                            label: 'Cancel',
                            size: TextSize.small,
                            weight: FontWeight.w600,
                            fontType: GoogleFonts.poppins,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                          ),
                        )),
                  ),
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        color: const Color(0xfff8c20d),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xfff8c20d))),
                    child: Center(
                        child: GestureDetector(
                          onTap: () {
                            controller.saveProfile();
                            Get.to(() => SignIn());
                          },
                          child: CustomText(
                            label: 'Save',
                            size: TextSize.small,
                            weight: FontWeight.w600,
                            fontType: GoogleFonts.poppins,
                            color: AppColors.whiteColor,
                          ),
                        )),
                  )
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}






class RegistrationController extends GetxController {
  // Controllers for textfields
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final streetController = TextEditingController();

  // Rx variables
  var selectedCity = "".obs;
  var selectedDistrict = "".obs;
  var imageFile = Rx<File?>(null);

  // Pick image
  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  // Validation Example
  String? validateField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  // Save Data (For API / DB later)
  void saveProfile() {
    if (nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        streetController.text.isNotEmpty &&
        selectedCity.isNotEmpty &&
        selectedDistrict.isNotEmpty) {
      Get.snackbar("Success", "Profile Saved Successfully");
    } else {
      Get.snackbar("Error", "Please fill all fields");
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    streetController.dispose();
    super.onClose();
  }
}
