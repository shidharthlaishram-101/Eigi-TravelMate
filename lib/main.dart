import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const EigiTravelMateApp());
}

class EigiTravelMateApp extends StatelessWidget {
  const EigiTravelMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eigi TravelMate',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFFF7F7F2),
      ),
      home: const HomeScreen(),
    );
  }
}
