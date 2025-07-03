import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2299A2),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Top Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'E&C\nCarwash',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF007788),
                            height: 0.9, // matches lineSpacingExtra=-4sp
                          ),
                        ),
                      ),
                      const Icon(Icons.menu, color: Colors.black),
                    ],
                  ),
                ),

                const Spacer(),

                // Center Text
                const Center(
                  child: Text(
                    'Welcome\nBestfriend!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                const Spacer(),

                // Bottom Navigation
                Row(
                  children: [
                    _buildNavButton('Home', isActive: true),
                    const SizedBox(width: 8),
                    _buildNavButton('Pending'),
                    const SizedBox(width: 8),
                    _buildNavButton('History'),
                  ],
                ),

                const SizedBox(height: 90), // Space for floating button
              ],
            ),
          ),

          // Floating Button (Bottom Right)
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {},
              child: const Text(
                '+',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(String label, {bool isActive = false}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? const Color(0xFF006B79) : const Color(0xFF88D4DB),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
