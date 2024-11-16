import 'package:flutter/material.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recordatorios',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 48),
        ),
      ),
      body: const Center(
        child: Text(
          'Configura tus recordatorios aquí.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
