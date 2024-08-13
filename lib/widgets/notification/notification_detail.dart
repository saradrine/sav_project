import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sav_project/theme/colors.dart';
import 'dart:async';

class NotificationDetail extends StatefulWidget {
  final notification;

  const NotificationDetail({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  _NotificationDetailState createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      setState(() {
        // This will update the UI every minute
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String formatNotificationDate(String dateString) {
    final date = DateTime.parse(dateString);
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 60) {
      if(difference.inMinutes == 0){
        return 'à l\'instant';
      } else {
        return 'il y a ${difference.inMinutes}m';
      }
    } else if (difference.inHours < 3) {
      return 'il y a ${difference.inHours}h';
    } else {
      return DateFormat('dd/MM/yyyy h:mm a').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSeen = widget.notification['isSeen'] ?? false;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.notification['content'],
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatNotificationDate(widget.notification['createdAt']),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              if (!isSeen)
                Icon(
                  Icons.circle,
                  color: AppColors.kPrimaryColor,
                  size: 14,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
