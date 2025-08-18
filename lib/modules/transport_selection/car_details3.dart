import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarDetailsScreen extends StatefulWidget {
  const CarDetailsScreen({super.key});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  String selectedOption = "Ride Now";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Car Details",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Car Name + Rating
            Text(
              "Mustang Shelby GT",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 20),
                const SizedBox(width: 4),
                Text(
                  "4.9 (531 reviews)",
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Car Image
            Center(
              child: Image.network(
                "assets/mustang.png", // Replace with your image
                height: 180,
              ),
            ),
            const SizedBox(height: 20),

            // Specifications
            Text(
              "Specifications",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSpecBox(Icons.flash_on, "Max power", "450hp"),
                _buildSpecBox(Icons.local_gas_station, "Fuel", "Petrol"),
                _buildSpecBox(Icons.speed, "Top speed", "250km/h"),
                _buildSpecBox(Icons.social_distance, "Distance", "500km"),
              ],
            ),
            const SizedBox(height: 20),

            // Car Features
            Text(
              "Car features",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            _buildFeatureBox("Model", "GT5000"),
            _buildFeatureBox("Capacity", "4 Seats"),
            _buildFeatureBox("Color", "Red"),
            _buildFeatureBox("Fuel type", "Petrol"),
            _buildFeatureBox("Gear type", "Automatic"),

            const SizedBox(height: 30),

            // Selectable Buttons
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = "Ride Now";
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: selectedOption == "Ride Now"
                            ? Colors.orange
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Ride Now",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: selectedOption == "Ride Now"
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = "Book Later";
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: selectedOption == "Book Later"
                            ? Colors.orange
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Book Later",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: selectedOption == "Book Later"
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecBox(IconData icon, String title, String value) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xfff8c20d))
      ),
      child: Column(
        children: [
          Icon(icon, size: 28, color: Colors.orange),
          const SizedBox(height: 6),
          Text(title,
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
          Text(value,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildFeatureBox(String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xfff8c20d))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey)),
          Text(value,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
        ],
      ),
    );
  }
}
