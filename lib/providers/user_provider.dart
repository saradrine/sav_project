import 'package:flutter/material.dart';
import 'package:sav_project/models/user.dart';
import 'package:sav_project/services/user_service.dart';
import 'package:sav_project/services/vehicle_service.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  Future<void> fetchUserById(BuildContext context, String id) async {
    try {
      _user = await UserService().fetchUserById(context, id);
      notifyListeners();
    } catch (e) {
      print('Error fetching user: $e');
    }
  }

  // final Map<String, dynamic> vehicleInput = {
  //   "marque": "MERCEDES",
  //   "modele": "G Class",
  //   "type": "VOITURE",
  //   "numChassis": "azrr244",
  //   "immatriculation": "TUN12",
  //   "annee": "2022",
  //   "couleur": "rouge",
  //   "kilometrage": 1000,
  //   "clientID": 24
  // };

  // Future<void> createVehicle() async {
  //   try {
  //     await VehicleService().createVehicle(vehicleInput);
  //     notifyListeners();
  //   } catch (e) {
  //     print('Error creating vehicle: $e');
  //   }
  // }
}
