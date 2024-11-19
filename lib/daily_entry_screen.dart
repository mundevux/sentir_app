import 'package:flutter/material.dart';
import 'package:sentir_app/widgets/custom_button.dart';

class DailyEntryScreen extends StatelessWidget {
  const DailyEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Hoy me siento',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 38)),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(labelText: 'Escribe tu entrada'),
            ),
            CustomButton(
              text: 'Guardar Entrada',
              icon: Icons.save,
              onPressed: () => {},
            )
          ],
        ),
      ),
    );
  }
}
