import 'package:flutter/material.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ElevatedButton(onPressed: () {}, child: const Text('Guardar Meta'))
          ],
        ),
      ),
    );
  }
}
