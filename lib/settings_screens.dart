import 'package:flutter/material.dart';

// ---------------- Settings Screen ----------------
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Change Password"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ChangePasswordScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("Change Language"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ChangeLanguageScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text("Privacy Policy"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text("Contact Us"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ContactUsScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text("Delete Account"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DeleteAccountScreen()));
            },
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

    return Scaffold(
      appBar: AppBar(title: const Text("Change Password")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
            TextField(
              controller: confirmPassword,
              decoration: const InputDecoration(labelText: "Confirm Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- Change Language Screen ----------------
class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = [
      "English",
      "Urdu",
      "Arabic",
      "French",
      "German",
      "Turkish",
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("Change Language")),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.flag),
            title: Text(languages[index]),
            onTap: () {},
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
    return Scaffold(
      appBar: AppBar(title: const Text("Privacy Policy")),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "This is the privacy policy of the Taxi Booking App. "
              "We ensure your data is protected and will not be shared with third parties.",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
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

    return Scaffold(
      appBar: AppBar(title: const Text("Contact Us")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: phone,
              decoration: const InputDecoration(labelText: "Phone"),
            ),
            TextField(
              controller: message,
              maxLines: 4,
              decoration: const InputDecoration(labelText: "Message"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              child: const Text("Send Message"),
            ),
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
    return Scaffold(
      appBar: AppBar(title: const Text("Delete Account")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text("Delete"),
        ),
      ),
    );
  }
}
