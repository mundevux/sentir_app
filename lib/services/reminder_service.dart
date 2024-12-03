import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

tz.Location? local; // Convertimos 'local' en opcional.

Future<void> initNotifications() async {
  // Inicializamos las zonas horarias
  tz.initializeTimeZones();
  local = tz.getLocation('America/Bogota'); // Ajusta según tu zona horaria

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings();

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> programarNotificacion({
  required String id,
  required String titulo,
  required String cuerpo,
  required DateTime fechaHora,
}) async {
  // Validamos que 'local' esté inicializado antes de usarlo.
  if (local == null) {
    throw Exception(
        "La zona horaria local no está inicializada. Asegúrate de llamar a initNotifications() antes de programar notificaciones.");
  }

  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'recordatorios_id',
    'Recordatorios',
    importance: Importance.max,
    priority: Priority.high,
  );

  const DarwinNotificationDetails iosDetails = DarwinNotificationDetails();

  final NotificationDetails detalles = NotificationDetails(
    android: androidDetails,
    iOS: iosDetails,
  );

  await flutterLocalNotificationsPlugin.zonedSchedule(
    id.hashCode, // Un identificador único para cada notificación.
    titulo,
    cuerpo,
    tz.TZDateTime.from(
        fechaHora, local!), // Convertir la fecha a zona horaria local.
    detalles,
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
  );
}
