import 'package:flutter/material.dart';
import '../../widgets/booking_card.dart';

class BookingListScreen extends StatelessWidget {
  const BookingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample booking data
    final bookings = [
      {
        'service': 'Car Wash - Premium',
        'customer': 'John Doe',
        'date': 'July 2, 2025',
        'time': '2:00 PM',
        'status': 'Completed'
      },
      {
        'service': 'Interior Cleaning',
        'customer': 'Jane Smith',
        'date': 'July 3, 2025',
        'time': '10:00 AM',
        'status': 'Pending'
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Bookings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            final booking = bookings[index];
            return BookingCard(
              serviceName: booking['service']!,
              customerName: booking['customer']!,
              date: booking['date']!,
              time: booking['time']!,
              status: booking['status']!,
            );
          },
        ),
      ),
    );
  }
}
