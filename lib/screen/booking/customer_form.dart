import 'package:flutter/material.dart';
import 'package:booking/models/booking.dart';

class CustomerFormScreen extends StatefulWidget {
  const CustomerFormScreen({super.key});

  @override
  State<CustomerFormScreen> createState() => _CustomerFormScreenState();
}

class _CustomerFormScreenState extends State<CustomerFormScreen> {
  late Booking booking;

  final _first = TextEditingController();
  final _last = TextEditingController();
  final _phone = TextEditingController();
  final _plate = TextEditingController();
  final _date = TextEditingController();
  final _time = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    booking = ModalRoute.of(context)!.settings.arguments as Booking;
  }

  @override
  void dispose() {
    _first.dispose();
    _last.dispose();
    _phone.dispose();
    _plate.dispose();
    _date.dispose();
    _time.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                      child: Text('Customer Form',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(offset: Offset(1, 1), blurRadius: 2)
                              ]))),
                  const SizedBox(height: 20),
                  const SectionTitle('Customer Information'),
                  Row(children: [
                    Expanded(child: CustomInput(controller: _first, label: 'First Name')),
                    const SizedBox(width: 10),
                    Expanded(child: CustomInput(controller: _last, label: 'Last Name')),
                  ]),
                  const SizedBox(height: 10),
                  CustomInput(controller: _phone, label: 'Phone Number'),
                  const SizedBox(height: 20),
                  Row(children: [
                    Expanded(child: CustomInput(controller: _date, label: 'Date')),
                    const SizedBox(width: 10),
                    Expanded(child: CustomInput(controller: _time, label: 'Time')),
                  ]),
                  const SizedBox(height: 20),
                  const SectionTitle('Vehicle Information'),
                  CustomInput(controller: _plate, label: 'License Plate'),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: _actionBtn('Cancel Booking', Colors.red),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      booking
                        ..firstName = _first.text
                        ..lastName = _last.text
                        ..phone = _phone.text
                        ..plate = _plate.text
                        ..date = _date.text
                        ..time = _time.text;

                      Navigator.pushNamed(context, '/confirmation', arguments: booking);
                    },
                    child: _actionBtn('Confirm', const Color(0xFF26C5E4)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionBtn(String t, Color c) => Container(
    padding: const EdgeInsets.symmetric(vertical: 14),
    decoration: BoxDecoration(
        color: c,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(color: Colors.black45, blurRadius: 4, offset: Offset(2, 4))
        ]),
    child: Center(
        child: Text(t,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold))),
  );
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Text(text,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white));
}

class CustomInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const CustomInput({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600)),
      const SizedBox(height: 5),
      TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(60, 255, 255, 255),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
      )
    ]),
  );
}
