import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/utills/components/text_widget.dart';
import 'package:taxi/utills/components/yellow_button.dart';

import '../utills/controller/theme_controller/theme.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedReason;
  final _controller = TextEditingController();

  final List<String> _reasons = [
    "Vehicle not clean",
    "Driver was late",
    "Rude behavior",
    "Overcharged",
    "Other",
  ];

  void _submit() {
    if (_formKey.currentState!.validate() && _selectedReason != null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 30),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle,
                    color: Colors.green, size: 80),
                const SizedBox(height: 15),
                 Text(
                  "Send successful",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,),
                ),
                const SizedBox(height: 8),
                Text(
                  "Your complaint has been sent successfully",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey
                      : Colors.black,),
                ),
                const SizedBox(height: 20),
                YellowButton(buttonText: 'Back home', ontap: (){
                  Navigator.of(context).pop(); // back home
                })
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button + Title
              Row(
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.pop(context),
                    child: Row(
                      children: [
                        SizedBox(width: 4),
                        CustomText(label: 'Back', size:TextSize.small, weight: FontWeight.w400, fontType: GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey
                            : Colors.black,)
                      ],
                    ),
                  ),
                  const Spacer(),
                  CustomText(label: 'Complain', size: TextSize.large, weight: FontWeight.w600, fontType: GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey
                      : Colors.black,),
                  const Spacer(),
                  Obx(() => IconButton(
                      onPressed: () {
                        themeController.toggleTheme();
                      },
                      icon: Icon(
                        themeController.isDark.value == true
                            ? Icons.light_mode_outlined
                            : Icons.dark_mode_outlined,
                      ))),
                ],
              ),
              const SizedBox(height: 20),

              // Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Dropdown
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      hint: const Text("Select complaint reason"),
                      value: _selectedReason,
                      items: _reasons
                          .map((e) =>
                          DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (v) => setState(() => _selectedReason = v),
                      validator: (v) =>
                      v == null ? "Please select a reason" : null,
                    ),
                    const SizedBox(height: 16),

                    // TextField
                    TextFormField(
                      controller: _controller,
                      maxLines: 4,
                      maxLength: 200,
                      decoration: InputDecoration(
                        hintText: "Write your complaint here...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (v) => v == null || v.isEmpty
                          ? "Please enter complaint"
                          : null,
                    ),
                    const SizedBox(height: 20),

                    YellowButton(buttonText: 'Submit', ontap: _submit,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}