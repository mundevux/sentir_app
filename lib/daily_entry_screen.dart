import 'package:flutter/material.dart';
import 'package:sentir_app/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // Para manejar datos JSON

class DailyEntryScreen extends StatefulWidget {
  const DailyEntryScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DailyEntryScreenState createState() => _DailyEntryScreenState();
}

class _DailyEntryScreenState extends State<DailyEntryScreen> {
  final TextEditingController _controller = TextEditingController();
  String? _selectedFeeling; // Guardar el sentimiento seleccionado
  List<Map<String, String>> _entries = [];

  @override
  void initState() {
    super.initState();
    _loadEntries();
  }

  Future<void> _loadEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final String? entriesData = prefs.getString('daily_entries');
    if (entriesData != null) {
      setState(() {
        _entries = (jsonDecode(entriesData) as List).map((entry) {
          return {
            'feeling': entry['feeling'].toString(),
            'text': entry['text'].toString(),
            'date': entry['date'].toString(),
          };
        }).toList();
      });
    }
  }

  Future<void> _saveEntry() async {
    if (_selectedFeeling == null || _controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Por favor, selecciona un sentimiento y escribe tus pensamientos.')),
      );
      return;
    }

    final newEntry = {
      'feeling': _selectedFeeling!,
      'text': _controller.text,
      'date': DateTime.now().toString(),
    };

    setState(() {
      _entries.add(newEntry);
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('daily_entries', jsonEncode(_entries));
    _controller.clear();
    _selectedFeeling = null; // Reiniciar sentimiento seleccionado
  }

  void _selectFeeling(String feeling) {
    setState(() {
      _selectedFeeling = feeling;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 48,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Hoy me siento...',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.sentiment_very_satisfied,
                      color: _selectedFeeling == 'Feliz'
                          ? Colors.green
                          : Colors.grey,
                      size: 40,
                    ),
                    onPressed: () => _selectFeeling('Feliz'),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: Icon(
                      Icons.sentiment_dissatisfied,
                      color: _selectedFeeling == 'Triste'
                          ? Colors.orange
                          : Colors.grey,
                      size: 40,
                    ),
                    onPressed: () => _selectFeeling('Triste'),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: _selectedFeeling == 'Enojado'
                          ? Colors.red
                          : Colors.grey,
                      size: 40,
                    ),
                    onPressed: () => _selectFeeling('Enojado'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: TextField(
                  controller: _controller,
                  maxLines: 2,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true,
                      labelText: 'Escribe tus pensamientos aquí...',
                      labelStyle: TextStyle(fontSize: 10)),
                  style: TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                  text: 'Guardar', icon: Icons.save, onPressed: _saveEntry),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _entries.length,
                  itemBuilder: (context, index) {
                    final entry = _entries[index];
                    return Card(
                      child: ListTile(
                        leading: Icon(
                          entry['feeling'] == 'Feliz'
                              ? Icons.sentiment_very_satisfied
                              : entry['feeling'] == 'Triste'
                                  ? Icons.sentiment_dissatisfied
                                  : Icons.sentiment_very_dissatisfied,
                          color: entry['feeling'] == 'Feliz'
                              ? Colors.green
                              : entry['feeling'] == 'Triste'
                                  ? Colors.orange
                                  : Colors.red,
                        ),
                        title: Text(
                          entry['feeling'] ?? '',
                          style: TextStyle(fontSize: 12),
                        ),
                        subtitle: Text(
                          entry['text'] ?? '',
                          style: TextStyle(fontSize: 10),
                        ),
                        trailing: Text(
                          DateTime.parse(entry['date'] ?? '')
                              .toLocal()
                              .toString()
                              .split(' ')[0],
                          style:
                              const TextStyle(fontSize: 8, color: Colors.grey),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
