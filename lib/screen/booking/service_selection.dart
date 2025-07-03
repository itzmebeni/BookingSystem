import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../provider/booking_provider.dart';
import '../../model/booking.dart';

class ServiceSelectionScreen extends StatefulWidget {
  const ServiceSelectionScreen({super.key});

  @override
  State<ServiceSelectionScreen> createState() => _ServiceSelectionScreenState();
}

class _ServiceSelectionScreenState extends State<ServiceSelectionScreen> {
  final List<String> _services = [
    'Exterior Wash',
    'Interior Cleaning',
    'Engine Detailing',
    'Wax & Polish',
  ];

  final Set<String> _selectedServices = {};

  bool _isSubmitting = false;

  // Normally these should come from previous screens:
  final String customerName = 'John Doe';
  final String contactNumber = '09123456789';
  final String selectedCar = 'Toyota Vios';

  Future<void> _submitServices() async {
    if (_selectedServices.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one service')),
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    final booking = Booking(
      customerName: customerName,
      contactNumber: contactNumber,
      selectedCar: selectedCar,
      selectedServices: _selectedServices.toList(),
      date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      time: DateFormat('hh:mm a').format(DateTime.now()),
    );

    try {
      await Provider.of<BookingProvider>(context, listen: false).submitBooking(booking);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Booking submitted successfully!')),
      );

      // Navigate or reset as needed
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BookingListScreen()));

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit booking: $e')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Services')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth > 600;

          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: isTablet ? 500 : double.infinity),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Choose services:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    ..._services.map(
                          (service) => CheckboxListTile(
                        title: Text(service),
                        value: _selectedServices.contains(service),
                        onChanged: (selected) {
                          setState(() {
                            if (selected == true) {
                              _selectedServices.add(service);
                            } else {
                              _selectedServices.remove(service);
                            }
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isSubmitting ? null : _submitServices,
                        child: _isSubmitting
                            ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                            : const Text('Finish Booking'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
