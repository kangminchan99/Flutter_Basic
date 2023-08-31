import 'package:flutter/material.dart';
import 'package:flutter_basic/local_notifications.dart';

class LocalNotificationsScreen extends StatefulWidget {
  const LocalNotificationsScreen({super.key});

  @override
  State<LocalNotificationsScreen> createState() =>
      _LocalNotificationsScreenState();
}

class _LocalNotificationsScreenState extends State<LocalNotificationsScreen> {
  @override
  void initState() {
    super.initState();
    LocalNotification.init();
    Future.delayed(const Duration(seconds: 3),
        LocalNotification.requestNotificationPermission());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LocalNotifications'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => LocalNotification.showNotification(),
          child: const Text('알림'),
        ),
      ),
    );
  }
}
