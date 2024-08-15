import 'package:flutter/material.dart';
import 'package:sav_project/screens/layout.dart';
import 'package:sav_project/services/vehicle_service.dart';
import 'dart:async';

class VehiculeProvider extends ChangeNotifier {
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<void> createVehicle(
      BuildContext context,
      String marque,
      String modele,
      String type,
      String numChassis,
      String immatriculation,
      String annee,
      String couleur,
      int kilometrage) async {
    try {
      await VehicleService().createVehicle(context, {
        "marque": marque,
        "modele": modele,
        "type": type,
        "numChassis": numChassis,
        "immatriculation": immatriculation,
        "annee": annee,
        "couleur": couleur,
        "kilometrage": kilometrage,
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Layout(initialIndex: 2);
          },
        ),
      );
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Une erreur est survenue';
      notifyListeners();
      // Set a timer to clear the error message after 5 seconds
      Timer(Duration(seconds: 5), () {
        _errorMessage = null;
        notifyListeners();
      });
      print('Error creating vehicle: $e');
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
  Future<void> updateVehicle(
    BuildContext context,
    String marque,
    String modele,
    String type,
    String numChassis,
    String immatriculation,
    String annee,
    String couleur,
    int kilometrage,
    String id,
  ) async {
    try {
      await VehicleService().updateVehicle(
        context,
        {
          "marque": marque,
          "modele": modele,
          "type": type,
          "numChassis": numChassis,
          "immatriculation": immatriculation,
          "annee": annee,
          "couleur": couleur,
          "kilometrage": kilometrage,
        },
        id,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Layout(initialIndex: 2);
          },
        ),
      );
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Une erreur est survenue';
      notifyListeners();
      // Set a timer to clear the error message after 5 seconds
      Timer(Duration(seconds: 5), () {
        _errorMessage = null;
        notifyListeners();
      });
      print('Error updating vehicle: $e');
    }
  }
}
