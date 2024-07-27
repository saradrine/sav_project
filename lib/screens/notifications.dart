import 'package:flutter/material.dart';
import 'package:sav_project/widgets/notification/notification_card.dart';
import 'package:sav_project/models/notif.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Notif> notifications = [
    Notif(
      id: 1,
      text: 'Today Lorem Ipsum is simply dummy text simply dummy text.',
      date: DateTime.parse('2024-06-29 12:15:00'),
      isUnRead: true,
    ),
    Notif(
      id: 2,
      text: 'Today Lorem Ipsum is simply dummy text simply dummy text.',
      date: DateTime.parse('2024-06-29 01:30:00'),
      isUnRead: true,
    ),
    Notif(
      id: 3,
      text: 'Today Lorem Ipsum is simply dummy text simply dummy text.',
      date: DateTime.parse('2024-06-29 00:30:00'),
    ),
    Notif(
      id: 4,
      text: 'Last 3 Lorem Ipsum is simply dummy text simply dummy text.',
      date: DateTime.parse('2024-06-26 14:30:00'),
    ),
    Notif(
      id: 5,
      text: 'Last 10 Lorem Ipsum is simply dummy text simply dummy text.',
      date: DateTime.parse('2024-06-19 10:00:00'),
    ),
  ];

  List<Notif> getNouveauNotifications() {
    final today = DateTime.now();
    return notifications
        .where((notification) =>
            notification.date.year == today.year &&
            notification.date.month == today.month &&
            notification.date.day == today.day)
        .toList();
  }

  List<Notif> getDerniers7JoursNotifications() {
    final today = DateTime.now();
    return notifications
        .where((notification) =>
            notification.date.isAfter(today.subtract(Duration(days: 7))) &&
            notification.date.isBefore(today.subtract(Duration(days: 1))))
        .toList();
  }

  List<Notif> getAncienNotifications() {
    final today = DateTime.now();
    return notifications
        .where((notification) =>
            notification.date.isBefore(today.subtract(Duration(days: 7))))
        .toList();
  }

  void onDismissed(Notif notification) {
    setState(() {
      notifications.remove(notification);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 16),
        child: ListView(
          children: [
            if (getNouveauNotifications().isNotEmpty) ...[
              NotificationCard(
                title: 'Nouveau',
                notifications: getNouveauNotifications(),
                onDismissed: onDismissed,
              ),
              SizedBox(height: 16),
            ],
            if (getDerniers7JoursNotifications().isNotEmpty) ...[
              NotificationCard(
                title: 'Derniers 7 jours',
                notifications: getDerniers7JoursNotifications(),
                onDismissed: onDismissed,
              ),
              SizedBox(height: 16),
            ],
            if (getAncienNotifications().isNotEmpty)
              NotificationCard(
                title: 'Ancien',
                notifications: getAncienNotifications(),
                onDismissed: onDismissed,
              ),
            if (notifications.isEmpty)
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'Aucune notification',
                    style: TextStyle(
                        fontSize: 17,
                        color: const Color.fromARGB(255, 122, 122, 122)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
