import 'package:flutter/material.dart';
import 'package:sentir_app/daily_entry_screen.dart';
import 'package:sentir_app/goal_screen.dart';
import 'package:sentir_app/progress_screen.dart'; // Nueva importación
import 'package:sentir_app/reminders_screen.dart'; // Nueva importación

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          // Contenido de la mitad inferior de la pantalla
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 32.0, bottom: 16.0, left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Bienvenido a Sentir',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 84,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Explora tus emociones y establece metas para el bienestar emocional.',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black54,
                    ),
                  ),
                  const Spacer(),
                  // Botón "Registro Diario"
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DailyEntryScreen(),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.edit),
                          SizedBox(width: 8),
                          Padding(
                            padding: EdgeInsets.only(top: 12, bottom: 12),
                            child: Text(
                              'Registro Diario',
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Botón "Registrar Metas"
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GoalScreen(),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.flag),
                          SizedBox(width: 8),
                          Padding(
                            padding: EdgeInsets.only(top: 12, bottom: 12),
                            child: Text(
                              'Registrar Metas',
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Botón "Visualización de Progreso"
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProgressScreen(),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.show_chart),
                          SizedBox(width: 8),
                          Padding(
                            padding: EdgeInsets.only(top: 12, bottom: 12),
                            child: Text(
                              'Visualización de Progreso',
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Botón "Recordatorios"
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RemindersScreen(),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.alarm),
                          SizedBox(width: 8),
                          Padding(
                            padding: EdgeInsets.only(top: 12, bottom: 12),
                            child: Text(
                              'Recordatorios',
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
