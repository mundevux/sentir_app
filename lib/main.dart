import 'package:flutter/material.dart';
import 'package:sentir_app/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Sinteca',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Sentir - Diario personal de bienestar',
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
