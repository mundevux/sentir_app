import 'package:flutter/material.dart';
import 'package:sentir_app/home_screen.dart';
import 'package:sentir_app/services/reminder_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Sinteca',
      ),
      title: 'Sentir - Diario personal de bienestar',
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
