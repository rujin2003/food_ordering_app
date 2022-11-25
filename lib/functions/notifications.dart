import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();
  Future<void> intialize() async {
    AndroidInitializationSettings android_settings =
        AndroidInitializationSettings('@drawable/ic_email');
    final InitializationSettings settings =
        InitializationSettings(android: android_settings);

    await _localNotificationService.initialize(settings);
  }

  Future<NotificationDetails> _notificationdetails() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('channel_id', 'channel_name',
            channelDescription: 'discription',
            importance: Importance.max,
            priority: Priority.max,
            playSound: true);
    return NotificationDetails(android: androidNotificationDetails);
  }

  Future<void> showNotification(
      {required int id, required String title, required String body}) async {
    final details = await _notificationdetails();
    await _localNotificationService.show(id, title, body, details);
  }
}
