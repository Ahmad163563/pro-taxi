import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi/utills/components/text_widget.dart';
import 'package:taxi/utills/components/textformfield.dart';
import 'package:taxi/utills/components/yellow_button.dart';
import 'package:taxi/utills/controller/theme_controller/theme.dart';

// ---------------- Settings Screen ----------------
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 10),
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'Back',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w100,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey
                    : Colors.black,
              ),
            ),
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
        title: CustomText(
          label: 'Setting',
          size: TextSize.large,
          weight: FontWeight.w600,
          fontType: GoogleFonts.poppins,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xfff8c20d))),
            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              title: const Text("Change Password"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangePasswordScreen()));
              },
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xfff8c20d))),
            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              title: const Text("Change Language"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangeLanguageScreen()));
              },
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xfff8c20d))),
            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              title: const Text("Privacy Policy"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyScreen()));
              },
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xfff8c20d))),
            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              title: const Text("Contact Us"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactUsScreen()));
              },
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xfff8c20d))),
            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              title: const Text("Delete Account"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DeleteAccountScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- Change Password Screen ----------------
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    bool _obscureText = true;
    final TextEditingController oldPassword = TextEditingController();
    final TextEditingController newPassword = TextEditingController();
    final TextEditingController confirmPassword = TextEditingController();
    final ThemeController themeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 10),
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'Back',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w100,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey
                    : Colors.black,
              ),
            ),
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
        title: CustomText(
          label: 'Change Password',
          size: TextSize.large,
          weight: FontWeight.w600,
          fontType: GoogleFonts.poppins,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            textFormField(hintText: 'Old Password'),
            // TextField(
            //   obscureText: _obscureText,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     labelText: "Password",
            //     suffixIcon: IconButton(
            //       icon: Icon(
            //         _obscureText ? Icons.visibility_off : Icons.visibility,
            //       ),
            //       onPressed: () {
            //         setState(() {
            //           _obscureText = !_obscureText;
            //         });
            //       },
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            textFormField(hintText: 'New Password'),
            SizedBox(
              height: 10,
            ),
            textFormField(hintText: 'Confirm Password'),
            SizedBox(
              height: 30,
            ),
            YellowButton(buttonText: 'Save', ontap: () {})
          ],
        ),
      ),
    );
  }
}

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  final languages = [
    {"name": "English", "code": "gb"}, // UK Flag for English
    {"name": "Urdu", "code": "pk"}, // Pakistan
    {"name": "Arabic", "code": "sa"}, // Saudi Arabia
    {"name": "French", "code": "fr"}, // France
    {"name": "German", "code": "de"}, // Germany
    {"name": "Turkish", "code": "tr"}, // Turkey
  ];

  int? selectedIndex;

  String getFlagUrl(String code) {
    return "https://flagcdn.com/w40/$code.png";
  }

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 10),
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'Back',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w100,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey
                    : Colors.black,
              ),
            ),
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
        title: CustomText(
          label: 'Change Language',
          size: TextSize.large,
          weight: FontWeight.w600,
          fontType: GoogleFonts.poppins,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              getFlagUrl(languages[index]["code"]!),
              width: 32,
              height: 32,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.flag, color: Colors.grey),
            ),
            title: Text(languages[index]["name"]!),
            trailing: selectedIndex == index
                ? const Icon(Icons.check_circle, color: Colors.green)
                : null,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${languages[index]["name"]} selected")),
              );
            },
          );
        },
      ),
    );
  }
}

// ---------------- Privacy Policy Screen ----------------
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 10),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Back',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w100,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey
                      : Colors.black,
                ),
              ),
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
          title: CustomText(
            label: 'Privacy Policy',
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
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 8,
                ),
                CustomText(
                  label: 'Privacy Policy for Ride Share',
                  size: TextSize.medium,
                  weight: FontWeight.w400,
                  fontType: GoogleFonts.poppins,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              label:
                  "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and  (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, ",
              size: TextSize.small,
              weight: FontWeight.w200,
              fontType: GoogleFonts.poppins,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            )
          ],
        ));
  }
}

// ---------------- Contact Us Screen ----------------
class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController phone = TextEditingController();
    final TextEditingController message = TextEditingController();
    final ThemeController themeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 10),
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'Back',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w100,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey
                    : Colors.black,
              ),
            ),
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
        title: CustomText(
          label: 'Contact Us',
          size: TextSize.large,
          weight: FontWeight.w600,
          fontType: GoogleFonts.poppins,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(
                  hintText: 'Name', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: phone,
              decoration: const InputDecoration(
                  hintText: 'Email', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: message,
              maxLines: 4,
              decoration: const InputDecoration(
                  hintText: 'Message', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            YellowButton(buttonText: 'Send Message', ontap: () {})
          ],
        ),
      ),
    );
  }
}

// ---------------- Delete Account Screen ----------------
class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 10),
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'Back',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w100,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey
                    : Colors.black,
              ),
            ),
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
        title: CustomText(
          label: 'Delete Account',
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
          Row(
            children: [
              CustomText(
                  label:
                      ' After deletion, you will not be able to log in again.\nplease read the followng instruction.\n deleting your account removal personal info\nfrom database. to our email become permamnently\n reserved adnsame',
                  size: TextSize.small,
                  weight: FontWeight.w200,
                  fontType: GoogleFonts.poppins,color:  Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,)
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("Delete",style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
