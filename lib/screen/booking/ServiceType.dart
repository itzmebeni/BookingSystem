import 'package:flutter/material.dart';
import 'package:booking/models/booking.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  late Booking booking;

  final List<Map<String, dynamic>> allServices = List.generate(15, (i) {
    return {
      'name': 'EC ${i + 1}',
      'details': 'Carwash / Repaint',
      'price': 125 + (i % 3) * 25,
    };
  });

  final List<Map<String, dynamic>> selectedServices = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    booking = ModalRoute.of(context)!.settings.arguments as Booking;
  }

  void toggleService(Map<String, dynamic> s) => setState(() {
    selectedServices.contains(s)
        ? selectedServices.remove(s)
        : selectedServices.add(s);
  });

  void clearBooking() => setState(selectedServices.clear);

  int get totalAmount =>
      selectedServices.fold(0, (sum, s) => sum + s['price'] as int);

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
                  blurRadius: 4)
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
              IconButton(icon: const Icon(Icons.menu, color: Colors.black87), onPressed: () {}),
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
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Text(
                  'Services',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(offset: Offset(1, 1), blurRadius: 2, color: Colors.black45)],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade700,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(102, 0, 0, 0),
                        offset: Offset(0, 3),
                        blurRadius: 4,
                      )
                    ],
                  ),
                  child: Text('Vehicle: ${booking.carType}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                    itemCount: allServices.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (context, i) {
                      final s = allServices[i];
                      final selected = selectedServices.contains(s);
                      return GestureDetector(
                        onTap: () => toggleService(s),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: selected ? Colors.tealAccent[50] : Colors.teal[800],
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [BoxShadow(color: Colors.black45, blurRadius: 4, offset: Offset(2, 4))],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(s['name'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                              const SizedBox(height: 4),
                              Text(s['details'], style: const TextStyle(color: Colors.white70, fontSize: 12)),
                              const Spacer(),
                              Text('₱${s['price']}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(77, 0, 0, 0),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Service', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            Text('Amount', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ]),
                      const SizedBox(height: 4),
                      if (selectedServices.isEmpty)
                        const Text('No services selected', style: TextStyle(color: Colors.white))
                      else
                        ...selectedServices.map((item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(item['name'], style: const TextStyle(color: Colors.white)),
                                Text('₱${item['price']}', style: const TextStyle(color: Colors.white)),
                              ]),
                        )),
                      if (selectedServices.isNotEmpty) const Divider(),
                      if (selectedServices.isNotEmpty)
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Total:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              Text('₱$totalAmount', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ]),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          clearBooking();
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 4,
                                    offset: Offset(2, 4))
                              ]),
                          child: const Center(
                            child: Text('Cancel Booking', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: GestureDetector(
                        onTap: selectedServices.isEmpty
                            ? null
                            : () {
                          booking.services = selectedServices
                              .map((m) => ServiceItem(m['name'], m['price'] as int))
                              .toList();
                          Navigator.pushNamed(context, '/customer', arguments: booking);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                              color: selectedServices.isEmpty ? Colors.grey : const Color(0xFF26C5E4),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 4,
                                    offset: Offset(2, 4))
                              ]),
                          child: const Center(
                            child: Text('Proceed', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
