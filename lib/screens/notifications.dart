import 'package:flutter/material.dart';
import 'package:sav_project/widgets/notification_card.dart';
import 'package:sav_project/models/notif.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Notif> notifications = [
    Notif(
      text: 'Today Lorem Ipsum is simply dummy text simply dummy text.',
      date: DateTime.parse('2024-06-29 12:15:00'),
      isUnRead: true,
    ),
    Notif(
      text: 'Today Lorem Ipsum is simply dummy text simply dummy text.',
      date: DateTime.parse('2024-06-29 01:30:00'),
      isUnRead: true,
    ),
    Notif(
      text: 'Today Lorem Ipsum is simply dummy text simply dummy text.',
      date: DateTime.parse('2024-06-29 00:30:00'),
    ),
    Notif(
      text: 'Last 3 Lorem Ipsum is simply dummy text simply dummy text.',
      date: DateTime.parse('2024-06-26 14:30:00'),
    ),
    Notif(
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        AssetImage('assets/icons/arrow.png'),
                        size: 33,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 70),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
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
                        fontSize: 20,
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