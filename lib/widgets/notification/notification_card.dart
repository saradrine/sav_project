import 'package:flutter/material.dart';
import 'package:sav_project/widgets/notification/notification_detail.dart';
import 'package:sav_project/models/notif.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final List<Notif> notifications;
  final Function(Notif) onDismissed;

  const NotificationCard({
    Key? key,
    required this.title,
    required this.notifications,
    required this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Column(
              children: [
                for (var notification in notifications)
                  Column(
                    children: [
                      if (notifications.indexOf(notification) > 0)
                        Divider(color: Colors.grey),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Dismissible(
                          key: Key(notification.hashCode.toString()),
                          onDismissed: (direction) {
                            onDismissed(notification);
                          },
                          direction: DismissDirection.endToStart,
                          background: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 185, 11, 0),
                            ),
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ImageIcon(
                                        AssetImage('assets/icons/delete.png'),
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        'Supprimer',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          child: NotificationDetail(notification: notification),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
