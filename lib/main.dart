import 'package:booking/screen/auth/ChangePass.dart';
import 'package:booking/screen/booking/ServiceType.dart';
import 'package:booking/screen/auth/signup_screen.dart';
import 'package:booking/screen/history/history_screen.dart';
import 'package:booking/screen/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'screen/auth/login_screen.dart'; // Add this import for the LoginPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black, // icon & text color
          elevation: 0,
        ),
      ),
      home: const ProfileScreen(),
    );
  }
}

