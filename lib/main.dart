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
        primarySwatch: Colors.blue,
        hintColor: Colors.orange,
        fontFamily: 'Sinteca',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Sentir - Diario personal de bienestar',
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
