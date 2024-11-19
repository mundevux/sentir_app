import 'package:flutter/material.dart';
import 'package:sentir_app/widgets/custom_button.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text(
          'Mis Metas',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 48),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(labelText: 'Escribe tu nueva meta'),
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
