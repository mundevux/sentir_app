import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  int _totalGoals = 0;
  int _completedGoals = 0;
  Map<String, int> _feelingCounts = {'Feliz': 0, 'Triste': 0, 'Enojado': 0};

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();

    // Cargar metas
    final String? goalsData = prefs.getString('user_goals');
    if (goalsData != null) {
      final goals = (jsonDecode(goalsData) as List<dynamic>);
      setState(() {
        _totalGoals = goals.length;
        _completedGoals =
            goals.where((goal) => goal['completed'] as bool).length;
      });
    }

    // Cargar registros diarios y contar sentimientos
    final String? entriesData = prefs.getString('daily_entries');
    if (entriesData != null) {
      final entries = (jsonDecode(entriesData) as List<dynamic>);
      Map<String, int> counts = {'Feliz': 0, 'Triste': 0, 'Enojado': 0};

      for (var entry in entries) {
        final String feeling = entry['feeling'] as String;
        if (counts.containsKey(feeling)) {
          counts[feeling] = counts[feeling]! + 1;
        }
      }

      setState(() {
        _feelingCounts = counts;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double completionRate = _totalGoals > 0
        ? (_completedGoals / _totalGoals) * 100
        : 0; // Porcentaje de metas completadas

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 48,
            ),
            const Text(
              'Resumen de Metas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: _totalGoals > 0
                        ? _completedGoals / _totalGoals
                        : 0, // Progreso de metas completadas
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue,
                    minHeight: 12,
                  ),
                ),
                const SizedBox(width: 10),
                Text('${completionRate.toStringAsFixed(1)}%'),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Metas completadas: $_completedGoals de $_totalGoals',
              style: const TextStyle(fontSize: 14),
            ),
            const Divider(height: 32, thickness: 1),
            const Text(
              'Registros diarios por sentimiento',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _feelingIndicator(
                  'Feliz',
                  Colors.green,
                  _feelingCounts['Feliz'] ?? 0,
                ),
                _feelingIndicator(
                    'Triste', Colors.blue, _feelingCounts['Triste'] ?? 0),
                _feelingIndicator(
                    'Enojado', Colors.red, _feelingCounts['Enojado'] ?? 0),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(height: 32, thickness: 1),
            const Text(
              '¡Sigue avanzando hacia tus metas! 🚀',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _feelingIndicator(String label, Color color, int count) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 24,
          child: Text(
            '$count',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
