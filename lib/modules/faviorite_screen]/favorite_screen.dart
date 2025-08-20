import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/utills/components/text_widget.dart';

import '../../utills/controller/theme_controller/theme.dart';

class FavoriteScreen extends StatelessWidget {

  final List<Map<String, String>> items = [
    {"title": "Office", "subtitle": "2972 westhiemr Rd."},
    {"title": "Home", "subtitle": "2972 westhiemr Rd."},
    {"title": "Office", "subtitle": "2972 westhiemr Rd."},
    {"title":"House","subtitle":"2972 westhiemr Rd."},
    {"title":"Home","subtitle":"2972 westhiemr Rd."}
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: CustomText(label: 'Favourite', size: TextSize.large, weight: FontWeight.w600, fontType:  GoogleFonts.poppins,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.amber),
            ),
            child: ListTile(
              leading: Icon(Icons.location_on, color: Colors.black),
              title: Text(items[index]["title"]!,style: TextStyle(color: Colors.black),),
              subtitle: Text(items[index]["subtitle"]!,style: TextStyle(color: Colors.black),),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                },
              ),
              onTap: () {
              },
            ),
          );
        },
      ),
    );
  }
}
