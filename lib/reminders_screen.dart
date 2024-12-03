import 'package:flutter/material.dart';
import 'package:sentir_app/services/reminder_service.dart';
import 'package:sentir_app/widgets/custom_button.dart';
import 'package:intl/intl.dart';

class RemindersScreen extends StatefulWidget {
  const RemindersScreen({super.key});

  @override
  State<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  final TextEditingController _tituloController = TextEditingController();
  DateTime? _fechaHoraSeleccionada;

  Future<void> _seleccionarFechaHora(BuildContext context) async {
    final DateTime? fechaSeleccionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (fechaSeleccionada != null) {
      final TimeOfDay? horaSeleccionada = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (horaSeleccionada != null) {
        setState(() {
          _fechaHoraSeleccionada = DateTime(
            fechaSeleccionada.year,
            fechaSeleccionada.month,
            fechaSeleccionada.day,
            horaSeleccionada.hour,
            horaSeleccionada.minute,
          );
        });
      }
    }
  }

  void _guardarRecordatorio() async {
    if (_tituloController.text.isEmpty || _fechaHoraSeleccionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Por favor completa todos los campos."),
        ),
      );
      return;
    }

    try {
      await programarNotificacion(
        id: _tituloController.text,
        titulo: "Recordatorio ⏰",
        cuerpo: _tituloController.text,
        fechaHora: _fechaHoraSeleccionada!,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Recordatorio guardado para ${DateFormat.yMd().add_jm().format(_fechaHoraSeleccionada!)}"),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al guardar recordatorio: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text(
          'Recordatorios',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 38),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _tituloController,
              decoration: const InputDecoration(
                labelText: "Nombre del Recordatorio",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _fechaHoraSeleccionada != null
                        ? DateFormat.yMd()
                            .add_jm()
                            .format(_fechaHoraSeleccionada!)
                        : "Selecciona fecha y hora",
                  ),
                ),
                IconButton(
                  onPressed: () => _seleccionarFechaHora(context),
                  icon: const Icon(Icons.calendar_today),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Guardar Recordatorio',
              icon: Icons.save,
              onPressed: _guardarRecordatorio,
            ),
          ],
        ),
      ),
    );
  }
}
