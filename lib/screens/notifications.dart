import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sav_project/providers/notifications_provider.dart';
import 'package:sav_project/services/notifications_service.dart';
import 'package:sav_project/widgets/notification/notification_card.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  
List<dynamic> filterAndSortNotifications(List<dynamic> notifications, bool Function(DateTime createdAt) condition) {
  final List<dynamic> filteredNotifications = notifications
      .where((notification) {
        final createdAt = DateTime.parse(notification['createdAt']);
        return condition(createdAt);
      })
      .toList();

  filteredNotifications.sort((a, b) => DateTime.parse(b['createdAt']).compareTo(DateTime.parse(a['createdAt'])));
  return filteredNotifications;
}

List<dynamic> getNouveauNotifications(List<dynamic> notifications) {
  final today = DateTime.now();
  return filterAndSortNotifications(notifications, (createdAt) =>
    createdAt.year == today.year &&
    createdAt.month == today.month &&
    createdAt.day == today.day
  );
}

List<dynamic> getDerniers7JoursNotifications(List<dynamic> notifications) {
  final now = DateTime.now();
  final startOfToday = DateTime(now.year, now.month, now.day);
  final endOfYesterday = startOfToday.subtract(Duration(seconds: 1));
  final startOfLastWeek = startOfToday.subtract(Duration(days: 7));

  return filterAndSortNotifications(notifications, (createdAt) =>
    createdAt.isAfter(startOfLastWeek) && createdAt.isBefore(endOfYesterday)
  );
}


List<dynamic> getAncienNotifications(List<dynamic> notifications) {
  final today = DateTime.now();
  final lastWeek = today.subtract(Duration(days: 7));
  return filterAndSortNotifications(notifications, (createdAt) =>
    createdAt.isBefore(lastWeek)
  );
}


  void onDismissed(BuildContext context, String id) async {
    try {
      await NotificationService().deleteNotification(context,id);
      setState(() {
        final notifications = context.read<NotificationProvider>().notifications;
        notifications.removeWhere((notification) => notification['id'] == id);      });
    } catch (e) {
      print('Failed to delete notification: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final notifications = context.watch<NotificationProvider>().notifications;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 16),
        child: ListView(
          children: [
            if (getNouveauNotifications(notifications).isNotEmpty) ...[
              NotificationCard(
                title: 'Nouveau',
                notifications: getNouveauNotifications(notifications),
                onDismissed: onDismissed,
              ),
              SizedBox(height: 16),
            ],
            if (getDerniers7JoursNotifications(notifications).isNotEmpty) ...[
              NotificationCard(
                title: 'Derniers 7 jours',
                notifications: getDerniers7JoursNotifications(notifications),
                onDismissed: onDismissed,
              ),
              SizedBox(height: 16),
            ],
            if (getAncienNotifications(notifications).isNotEmpty)
              NotificationCard(
                title: 'Ancien',
                notifications: getAncienNotifications(notifications),
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
