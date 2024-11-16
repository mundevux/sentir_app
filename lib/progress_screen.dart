import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Visualización de Progreso',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 48),
        ),
      ),
      body: const Center(
        child: Text(
          'Aquí se mostrará el progreso.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
