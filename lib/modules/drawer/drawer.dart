import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi/modules/google_location/google_location.dart';
import 'package:taxi/utills/components/text_widget.dart';

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({super.key});

  @override
  State<ProfileDrawer> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {


  String name = 'Nate Samsone';
  String email = 'natesamsone@example.com';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                CustomText(label: 'Back', size: TextSize.minismall, weight: FontWeight.w400, fontType: GoogleFonts.poppins,color: Colors.grey,)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: CircleAvatar(
                          radius: 44,
                          backgroundImage: NetworkImage('https://images.app.goo.gl/zs38FAdNSFgCDiZx5.png'),
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
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      CustomText(
                        label: name,
                        size: TextSize.medium,
                        weight: FontWeight.w600,
                        fontType: GoogleFonts.poppins,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  CustomText(
                    label: email,
                    size: TextSize.small,
                    weight: FontWeight.w300,
                    fontType: GoogleFonts.poppins,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey
                        : Colors.grey,
                  )
                ],
              ),
            ),
            const Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                  leading: Icon(Icons.person_outline),
                  title: CustomText(
                    label: 'Edit Profile',
                    size: TextSize.small,
                    weight: FontWeight.w400,
                    fontType: GoogleFonts.poppins,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )),
            ),
            const Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                  leading: Icon(Icons.location_on),
                  title: CustomText(
                    label: 'Address',
                    size: TextSize.small,
                    weight: FontWeight.w400,
                    fontType: GoogleFonts.poppins,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )),
            ),
            const Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                  leading: Icon(Icons.history_edu),
                  title: CustomText(
                    label: 'History',
                    size: TextSize.small,
                    weight: FontWeight.w400,
                    fontType: GoogleFonts.poppins,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )),
            ),
            const Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                  leading: Icon(Icons.report),
                  title: CustomText(
                    label: 'Complain',
                    size: TextSize.small,
                    weight: FontWeight.w400,
                    fontType: GoogleFonts.poppins,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )),
            ),
            const Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                  leading: Icon(Icons.insert_invitation),
                  title: CustomText(
                    label: 'Referral',
                    size: TextSize.small,
                    weight: FontWeight.w400,
                    fontType: GoogleFonts.poppins,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )),
            ),
            const Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                  leading: Icon(Icons.report_off_outlined),
                  title: CustomText(
                    label: 'About Us',
                    size: TextSize.small,
                    weight: FontWeight.w400,
                    fontType: GoogleFonts.poppins,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )),
            ),
            const Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                  leading: Icon(Icons.settings),
                  title: CustomText(
                    label: 'Settings',
                    size: TextSize.small,
                    weight: FontWeight.w400,
                    fontType: GoogleFonts.poppins,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )),
            ),
            const Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                  leading: Icon(Icons.help),
                  title: CustomText(
                    label: 'Help and Support',
                    size: TextSize.small,
                    weight: FontWeight.w400,
                    fontType: GoogleFonts.poppins,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )),
            ),
            const Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                  leading: Icon(Icons.login_outlined),
                  title: CustomText(
                    label: 'LogOut',
                    size: TextSize.small,
                    weight: FontWeight.w400,
                    fontType: GoogleFonts.poppins,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
