import 'package:flutter/material.dart';
import 'package:sav_project/models/service.dart';
import 'package:sav_project/services/services_service.dart';

class ServicesProvider extends ChangeNotifier {
  List<Service>? _services;

  List<Service>? get services => _services;

  Future<void> fetchServices(BuildContext context) async {
    try {
      _services = await ServicesService().fetchServices(context);
      notifyListeners();
    } catch (e) {
      print('Error fetching services: $e');
    }
  }
  
}