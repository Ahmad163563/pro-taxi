import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/utills/components/text_widget.dart';
import 'package:taxi/utills/components/textformfield.dart';
import 'package:taxi/utills/components/yellow_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          label: 'Edit Profile',
          size: TextSize.large,
          weight: FontWeight.w600,
          fontType: GoogleFonts.poppins,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 204, vertical: 16),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        padding: const EdgeInsets.all(1), // border ki width
                        decoration: BoxDecoration(
                          color: Color(0xfff8c20d), // border color
                          shape: BoxShape.circle,),
                        child: CircleAvatar(
                          radius: 44,
                          backgroundImage: NetworkImage('https://images.app.goo.gl/zs38FAdNSFgCDiZx5.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 2,
                      right: 2,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.teal,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.camera_alt,
                            size: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
                       ),
           ),
          SizedBox(height: 15,),
          CustomText(label: 'Nate Samsone', size: TextSize.large, weight: FontWeight.w600, fontType: GoogleFonts.poppins,color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,),
          SizedBox(height: 15,),
          textFormField(hintText: 'notesan@gmail.com'),
          SizedBox(height: 10,),
          textFormField(hintText: 'Enter phone number'),
          SizedBox(height: 10,),
          textFormField(hintText: 'Gender'),
          SizedBox(height: 10,),
          textFormField(hintText: 'Address'),
          SizedBox(height: 30,),
          YellowButton(buttonText: 'Update', ontap: (){})
        ],
      ),
    );
  }
}
