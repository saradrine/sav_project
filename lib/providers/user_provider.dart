import 'package:flutter/material.dart';
import 'package:sav_project/models/user.dart';
import 'package:sav_project/services/user_service.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  Future<void> fetchUserById(String id) async {
    try {
      _user = await UserService().fetchUserById(id);
      notifyListeners();
    } catch (e) {
      print('Error fetching user: $e');
    }
  }
}
