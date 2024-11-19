import 'package:flutter/material.dart';
import 'package:sentir_app/daily_entry_screen.dart';
import 'package:sentir_app/goal_screen.dart';
import 'package:sentir_app/progress_screen.dart'; // Nueva importación
import 'package:sentir_app/reminders_screen.dart'; // Nueva importación
import 'package:sentir_app/widgets/custom_button.dart'; // Importación de Widget correspondiente al boton personalizado.

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Column(
        children: <Widget>[
          // Imagen que ocupa la mitad superior de la pantalla
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                child: Image.asset(
                  'assets/img/people-connected-social-media (1).jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 64,
          ),
          // Contenido de la mitad inferior de la pantalla
          Expanded(
            flex: 1,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Bienvenido a Sentir',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Explora tus emociones y establece metas para el bienestar emocional.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                  const Spacer(),
                  // Botones
                  CustomButton(
                      text: 'Registro Diario',
                      icon: Icons.edit,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DailyEntryScreen()));
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomButton(
                      text: 'Registrar Metas',
                      icon: Icons.flag,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GoalScreen()));
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomButton(
                      text: 'Visualización de Progreso',
                      icon: Icons.show_chart,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProgressScreen()));
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomButton(
                      text: 'Recordatorios',
                      icon: Icons.alarm,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RemindersScreen()));
                      }),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
