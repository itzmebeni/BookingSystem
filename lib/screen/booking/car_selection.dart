import 'package:flutter/material.dart';
import 'package:booking/models/booking.dart';


class CarSelectionScreen extends StatelessWidget {
  const CarSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFF2299A2), // fallback in case gradient fails
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(77, 0, 0, 0),
                  offset: Offset(0, 4),
                  blurRadius: 4),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              'E&C\nCarwash',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: 'Cinzel',
                color: Color(0xFF006B79),
                height: 1.1,
              ),
            ),
            actions: [
              // Profile Image Icon (on the right side)
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profile'); // Navigate to profile screen
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('https://www.example.com/your-profile-image.jpg'), // Replace with actual image URL
                    radius: 18,
                  ),
                ),
              ),
              // 3-dots Menu (Dropdown below the profile image)
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert, color: Colors.black87),
                onSelected: (value) {
                  if (value == 'logout') {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Logout"),
                        content: const Text("Are you sure you want to logout?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close dialog
                              // Clear navigation stack and go to login
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/login',
                                    (Route<dynamic> route) => false,
                              );
                            },
                            child: const Text("Logout", style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    );
                  }
                },
                offset: Offset(0, 50),  // Adjust this value to fine-tune the dropdown position
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 'logout',
                    child: Center(
                      child: Text('Logout', style: TextStyle(color: Colors.red)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Car Type',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.3,
                shadows: [
                  Shadow(
                    offset: Offset(1, 1),
                    blurRadius: 2,
                    color: Colors.black45,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  crossAxisSpacing: 20, // space between columns
                  mainAxisSpacing: 20, // space between rows
                  childAspectRatio: 1, // square aspect ratio
                ),
                itemCount: 5, // 5 items total
                itemBuilder: (context, index) {
                  return _carOption(
                    context,
                    ['SUV', 'SEDAN', 'VAN', 'MOTORCYCLE', 'PICK-UP'][index],
                    [
                      'assets/images/suv.png',
                      'assets/images/sedan.png',
                      'assets/images/van.png',
                      'assets/images/motorcycle.png',
                      'assets/images/pickup.webp'
                    ][index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _carOption(BuildContext context, String label, String imagePath) {
    return GestureDetector(
      onTap: () {
        final booking = Booking()..carType = label;
        Navigator.pushNamed(context, '/services', arguments: booking);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(0, 0, 0, 0.3),
              offset: const Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF006B79),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
