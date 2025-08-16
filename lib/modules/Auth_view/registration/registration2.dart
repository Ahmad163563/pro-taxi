import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:taxi/utills/app_constant/app_color.dart';
import 'package:taxi/utills/components/text_widget.dart';
import 'package:taxi/utills/components/textformfield.dart';

import '../../../utills/controller/theme_controller/theme.dart';

class Registration2 extends StatefulWidget {
  const Registration2({super.key});

  @override
  State<Registration2> createState() => _Scenario6State();
}

class _Scenario6State extends State<Registration2> {
  String? selectedCity;
  String? selectedDistrict;
  File? imageFile;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

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
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: imageFile != null
                          ? FileImage(imageFile!)
                          : const AssetImage('assets/chloe.jpg')
                              as ImageProvider,
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: pickImage,
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
                ),
              ),
              const SizedBox(height: 20),
              textFormField(hintText: 'Full Name'),
              SizedBox(
                height: 12,
              ),
              textFormField(hintText: 'Enter phone number'),
              SizedBox(
                height: 12,
              ),
              textFormField(hintText: 'Email'),
              SizedBox(
                height: 12,
              ),
              textFormField(hintText: 'Street'),
              SizedBox(
                height: 12,
              ),
              DropdownButtonFormField<String>(
                  value: selectedCity,
                  decoration: InputDecoration(
                    hintText: 'Gender',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  ),
                  icon: Icon(Icons.arrow_drop_down), // arrow icon
                  items: ["D.I.Khan", "Tank", "D.G.Khan"].map((gender) {
                    return DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "City";
                    }
                  }),
              SizedBox(
                height: 12,
              ),
              DropdownButtonFormField<String>(
                  value: selectedDistrict,
                  decoration: InputDecoration(
                    hintText: 'Gender',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  ),
                  icon: Icon(Icons.arrow_drop_down), // arrow icon
                  items: ["Panyala", "Hattala", "Paharpur"].map((gender) {
                    return DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDistrict = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "District";
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xfff8c20d))),
                    child: Center(
                        child: GestureDetector(
                      onTap: () {},
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
                        color: Color(0xfff8c20d),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xfff8c20d))),
                    child: Center(
                        child: GestureDetector(
                      onTap: () {},
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
              SizedBox(
                height: 20,
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
