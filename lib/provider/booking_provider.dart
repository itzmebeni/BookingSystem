import 'dart:convert';
import 'package:flutter/foundation.dart'; // for ChangeNotifier
import 'package:http/http.dart' as http; // for API requests
import '../model/booking.dart'; // your Booking model

class BookingProvider with ChangeNotifier {
  Future<void> submitBooking(Booking booking) async {
    final url = Uri.parse('https://your-api.com/bookings');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(booking.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Booking submitted successfully!');
      } else {
        print('Failed: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error submitting booking: $e');
    }
  }
}
