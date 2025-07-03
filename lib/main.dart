// main.dart
import 'package:booking/screen/booking/car_selection.dart';
import 'package:booking/screen/booking/customer_form.dart';
import 'package:flutter/material.dart';
import 'package:booking/screen/auth/login_screen.dart';
import 'package:booking/screen/auth/signup_screen.dart';
import 'package:booking/screen/auth/ChangePass.dart';
import 'package:booking/screen/booking/ServiceType.dart';
import 'package:booking/screen/booking/booking_list_screen.dart';
import 'package:booking/screen/history/history_screen.dart';
import 'package:booking/screen/booking/car_selection.dart';
import 'package:booking/screen/booking/customer_form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      initialRoute: '/bookings',       // <‑‑ change this in one line
      routes: {
        '/login':      (_) => const LoginPage(),
        '/signup':     (_) => const SignUpScreen(),
        '/changePass': (_) => const ChangePasswordScreen(),
        '/services':   (_) => const ServicesScreen(),
        '/bookings':   (_) => const BookingListScreen(),
        '/history':    (_) => const HistoryScreen(),
        '/carselect':    (_) => const CarSelectionScreen(),
        '/customer':    (_) => const CustomerFormScreen(),



      },
    );
  }
}
