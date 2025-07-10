import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.3),
                offset: const Offset(0, 4),
                blurRadius: 4,
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
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
                // Position the dropdown just below the profile image
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



      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2299A2), Color(0xFF1F7E90)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Spacer(),
              const Center(
                child: Text(
                  'Welcome\nBestfriend!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50,
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
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/cars');
                  },
                  child: Container(
                    width: 55,
                    height: 55,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFB7F9F7),
                    ),
                    child: const Center(
                      child: Icon(Icons.add, size: 30, color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _navPill(
                    'Home',
                    isActive: true,
                    onTap: () {},
                  ),
                  _navPill(
                    'Pending',
                    onTap: () => Navigator.pushNamed(context, '/pending'),
                  ),
                  _navPill(
                    'History',
                    onTap: () => Navigator.pushNamed(context, '/history'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navPill(
      String label, {
        bool isActive = false,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        decoration: BoxDecoration(
          color:
          isActive ? const Color(0xFF00D6C6) : const Color(0xFF88D4DB),
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(2, 2),
              blurRadius: 3,
            )
          ],
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 2,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}