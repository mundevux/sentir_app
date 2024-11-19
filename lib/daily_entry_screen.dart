import 'package:flutter/material.dart';

class DailyEntryScreen extends StatelessWidget {
  const DailyEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Hoy me siento',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 48)),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(labelText: 'Escribe tu entrada'),
            ),
            ElevatedButton(
                onPressed: () {}, child: const Text('Guardar Entrada')),
          ],
        ),
      ),
    );
  }
}
