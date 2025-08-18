import 'package:flutter/material.dart';

class TransportSelection extends StatefulWidget {
  @override
  _TransportSelectionScreenState createState() =>
      _TransportSelectionScreenState();
}

class _TransportSelectionScreenState extends State<TransportSelection> {
  int? selectedIndex; // null means nothing selected

  final List<Map<String, String>> transports = [
    {"title": "Car", "image": "https://cdn-icons-png.flaticon.com/512/743/743922.png"},
    {"title": "Bike", "image": "https://cdn-icons-png.flaticon.com/512/3076/3076587.png"},
    {"title": "Cycle", "image": "https://cdn-icons-png.flaticon.com/512/888/888064.png"},
    {"title": "Taxi", "image": "https://cdn-icons-png.flaticon.com/512/296/296216.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Select transport"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text(
            "Select your transport",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemCount: transports.length,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.yellow.shade200 // selected -> light yellow
                          : Colors.grey.shade900, // default -> light black
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.orange,
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          transports[index]["image"]!,
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          transports[index]["title"]!,
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}