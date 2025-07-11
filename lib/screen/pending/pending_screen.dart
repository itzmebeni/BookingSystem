import 'package:flutter/material.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({super.key});

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
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.black87),
                onPressed: () {},
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
                    'Pending',
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

              // ── Booking Cards ──
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (_) => _bookingDetailsPopup(context),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF165661),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.3),
                              offset: Offset(2, 3),
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
                                Text('Date:',
                                    style: TextStyle(color: Colors.white)),
                                Text('05/27/2025',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Car Type:',
                                    style: TextStyle(color: Colors.white)),
                                Text('Sedan',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total:',
                                    style: TextStyle(color: Colors.white)),
                                Text('290.00',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
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
                    isActive: true,
                    onTap: () {},
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

  Widget _bookingDetailsPopup(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Back Button ──
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, size: 24),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            const SizedBox(height: 4),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Car Type:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Sedan'),
              ],
            ),
            const SizedBox(height: 6),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Date:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('05/27/2025'),
              ],
            ),
            const SizedBox(height: 6),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Time:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('9:30 am'),
              ],
            ),
            const SizedBox(height: 12),
            const Text('Services:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('EC1'),
                Text('130.00'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('EC1'),
                Text('160.00'),
              ],
            ),
            const Divider(thickness: 1, height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('290.00'),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close modal
                  // TODO: Add cancel logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF65D6E0),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.black54,
                  elevation: 4,
                ),
                child: const Text(
                  'Cancel Booking',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(blurRadius: 2, offset: Offset(1, 1))],
                  ),
                ),
              ),
            ),
          ],
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
