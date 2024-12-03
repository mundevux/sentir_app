import 'package:flutter/material.dart';
import 'package:sentir_app/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GoalScreenState createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  final TextEditingController _goalController = TextEditingController();
  List<Map<String, Object>> _goals = [];

  @override
  void initState() {
    super.initState();
    _loadGoals();
  }

  Future<void> _loadGoals() async {
    final prefs = await SharedPreferences.getInstance();
    final String? goalsData = prefs.getString('user_goals');
    if (goalsData != null) {
      setState(() {
        _goals = (jsonDecode(goalsData) as List<dynamic>)
            .map((goal) => {
                  'text': goal['text'] as String,
                  'completed': goal['completed'] as bool,
                })
            .toList();
      });
    }
  }

  Future<void> _saveGoals() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_goals', jsonEncode(_goals));
  }

  void _addGoal() {
    final String goalText = _goalController.text.trim();
    if (goalText.isNotEmpty) {
      setState(() {
        _goals.add({'text': goalText, 'completed': false});
        _goalController.clear();
      });
      _saveGoals();
    }
  }

  void _toggleGoalCompletion(int index) {
    setState(() {
      _goals[index]['completed'] = !(_goals[index]['completed'] as bool);
    });
    _saveGoals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 48,
                ),
                const Text(
                  'Mis metas',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
              ],
            ),
            // Campo para escribir la nueva meta
            TextField(
              controller: _goalController,
              decoration: const InputDecoration(
                  labelText: 'Escribe tu nueva meta',
                  labelStyle: TextStyle(fontSize: 10)),
            ),
            const SizedBox(height: 16),
            // Botón para guardar la meta
            CustomButton(
                text: 'Guardar meta',
                icon: Icons.save,
                onPressed: () {
                  _addGoal();
                }),
            const SizedBox(height: 16),
            // Lista de metas registradas
            Expanded(
              child: ListView.builder(
                itemCount: _goals.length,
                itemBuilder: (context, index) {
                  final goal = _goals[index];
                  return ListTile(
                    title: Text(
                      goal['text'] as String,
                      style: TextStyle(
                        decoration: (goal['completed'] as bool)
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontSize: 12,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        (goal['completed'] as bool)
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: (goal['completed'] as bool)
                            ? Colors.green
                            : Colors.grey,
                      ),
                      onPressed: () => _toggleGoalCompletion(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
