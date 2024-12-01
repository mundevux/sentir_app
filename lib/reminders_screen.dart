import 'package:flutter/material.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        title: const Text(
          'Recordatorios',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 38),
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
