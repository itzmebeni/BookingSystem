import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFF2299A2),
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
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                child: Center(
                  child: Text(
                    'History',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                      shadows: [Shadow(blurRadius: 2, offset: Offset(1, 1))],
                    ),
                  ),
                ),
              ),

              // ── History Cards ──
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFF165661),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(2, 3),
                            blurRadius: 4,
                          )
                        ],
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Date:', style: TextStyle(color: Colors.white)),
                              Text('05/27/2025', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Car Type:', style: TextStyle(color: Colors.white)),
                              Text('Sedan', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total:', style: TextStyle(color: Colors.white)),
                              Text('290.00', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              // ── Navigation Pills ──
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _navPill(
                    'Home',
                    onTap: () => Navigator.pushNamed(context, '/home'),
                  ),
                  _navPill(
                    'Pending',
                    onTap: () => Navigator.pushNamed(context, '/pending'),
                  ),
                  _navPill(
                    'History',
                    isActive: true,
                    onTap: () {
                      // already on Home → do nothing or scroll to top
                    },

                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Styled Navigation Pill ──
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
          color: isActive ? const Color(0xFF00D6C6) : const Color(0xFF88D4DB),
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
