import 'package:flutter/material.dart';

void main() {
  runApp(const CarwashFormApp());
}

class CarwashFormApp extends StatelessWidget {
  const CarwashFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CustomerFormScreen(),
    );
  }
}

class CustomerFormScreen extends StatelessWidget {
  const CustomerFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Match background with HistoryScreen gradient
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0f9ba8), Color(0xFF00344d)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                elevation: 1,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                ),
                title: const Text(
                  'E&C\nCarwash',
                  style: TextStyle(
                    fontFamily: 'Georgia',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                    height: 1.2,
                    shadows: [Shadow(offset: Offset(1, 1), blurRadius: 2, color: Colors.grey)],
                  ),
                ),
                actions: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(Icons.menu, size: 28, color: Colors.black),
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Customer Form',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [Shadow(offset: Offset(1, 1), blurRadius: 2)],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Customer Information',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Expanded(child: CustomInput(label: 'First Name')),
                          SizedBox(width: 10),
                          Expanded(child: CustomInput(label: 'Last Name')),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const CustomInput(label: 'Phone Number'),
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          Expanded(child: CustomInput(label: 'Date')),
                          SizedBox(width: 10),
                          Expanded(child: CustomInput(label: 'Time')),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Vehicle Information',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      const CustomInput(label: 'License Plate'),
                      const SizedBox(height: 30),
                      Center(
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal[400],
                                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                elevation: 5,
                              ),
                              child: const Text(
                                'Confirm',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.tealAccent[100],
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                shadowColor: Colors.black,
                                elevation: 2,
                              ),
                              child: const Text('Cancel Booking'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  final String label;
  const CustomInput({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
          ),
        ),
      ],
    );
  }
}
