import 'package:flutter/material.dart';
import 'package:booking/models/booking.dart';

class ConfirmationScreen extends StatelessWidget {
  final Booking booking;
  const ConfirmationScreen({super.key, required this.booking});



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: const Color(0xFF2299A2),
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

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            color: Colors.white,
            elevation: 6,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Confirmation',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF006B79))),
                    const SizedBox(height: 20),
                    _detail('Name',
                        '${booking.firstName ?? ''} ${booking.lastName ?? ''}'),
                    _detail('Number', booking.phone ?? ''),
                    _detail('Plate', booking.plate ?? ''),
                    _detail('Car Type', booking.carType ?? ''),
                    _detail('Date', booking.date ?? ''),
                    _detail('Time', booking.time ?? ''),
                    const SizedBox(height: 20),
                    const Text('Services:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    ...booking.services
                        .map((s) => _service(s.name, s.price.toDouble())),
                    const Divider(),
                    _service('Total', booking.total.toDouble(), isTotal: true),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _actionBtn(context, 'Cancel Booking', Colors.red, () {
                          Navigator.popUntil(context, ModalRoute.withName('/home'));
                        }),
                        _actionBtn(
                            context, 'Apply', const Color(0xFF26C5E4), () {
                          Navigator.popUntil(context, ModalRoute.withName('/home'));
                        }),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _detail(String t, String v) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text('$t:'), Text(v)]),
  );

  Widget _service(String s, double p, {bool isTotal = false}) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(s,
              style: TextStyle(
                  fontWeight:
                  isTotal ? FontWeight.bold : FontWeight.normal)),
          Text('₱${p.toStringAsFixed(2)}',
              style: TextStyle(
                  fontWeight:
                  isTotal ? FontWeight.bold : FontWeight.normal)),
        ]),
  );

  Widget _actionBtn(BuildContext c, String t, Color color,
      VoidCallback onTap) =>
      ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding:
            const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        child: Text(t,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
      );
}
