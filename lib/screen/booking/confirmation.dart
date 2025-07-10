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
                  blurRadius: 4)
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('E&C\nCarwash',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Cinzel',
                    color: Color(0xFF006B79),
                    height: 1.1)),
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
