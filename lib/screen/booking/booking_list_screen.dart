import 'package:flutter/material.dart';
import '../../widgets/booking_card.dart';

class BookingListScreen extends StatelessWidget {
  const BookingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      {
        'service': 'Engine Detailing',
        'customer': 'Chris M',
        'date': 'July 4, 2025',
        'time': '12:00 PM',
        'status': 'Cancelled'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking List'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Define breakpoint for tablet vs mobile
          final isTablet = constraints.maxWidth > 600;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: isTablet
                ? GridView.builder(
              itemCount: bookings.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // two columns on wide screen
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.5,
              ),
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
            )
                : ListView.separated(
                itemCount: bookings.length,
                separatorBuilder: (, _) => const SizedBox(height: 12),
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
          );
        },
      ),
    );
  }
}