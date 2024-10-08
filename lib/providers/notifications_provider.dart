import 'package:flutter/material.dart';
import 'package:sav_project/services/notifications_service.dart';

class NotificationProvider with ChangeNotifier {
  List<Map<String, dynamic>> _notifications = [];
  bool _isSubscribed = false;
  List<Map<String, dynamic>> get notifications => _notifications;
  bool _hasNewNotification = false;
  bool get hasNewNotification => _hasNewNotification;

  Future<void> fetchAllNotifications(BuildContext context) async {
    try {
      final allNotifications =
          await NotificationService().getAllNotifications(context);
      _notifications = allNotifications;
      _checkForNewNotifications();
      notifyListeners();
    } catch (e) {
      print('Error fetching all notifications: $e');
    }
  }

  void subscribeToNotifications(BuildContext context, String id) {
    if (_isSubscribed) return;

    NotificationService()
        .subscribeToAppointmentCreated(context,'admin')
        .listen((notification) {
      _notifications.add(notification);
      _hasNewNotification = true;
      notifyListeners();
    });

    NotificationService()
        .subscribeToAppointmentUpdated(context,'admin', id)
        .listen((notification) {
      _notifications.add(notification);
      print('Subscribed to notifications: $notifications');
      _hasNewNotification = true;
      notifyListeners();
    });
    _isSubscribed = true;
  }

  Future<void> markAllAsRead(BuildContext context) async {
    for (var notification in _notifications) {
      if (notification['isRead'] == false) {
        try {
          await NotificationService().markAsRead(context,notification['id']);
          notification['isRead'] = true;
        } catch (e) {
          print('Error marking notification as read: $e');
        }
      }
    }
    _hasNewNotification = false;
    notifyListeners();
  }

  void _checkForNewNotifications() {
    _hasNewNotification =
        _notifications.any((notification) => notification['isRead'] == false);
  }
}
