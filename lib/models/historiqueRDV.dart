import 'service.dart';
import 'vehicule.dart';

class Historiquerdv {
  final DateTime date;
  final String heure;
  final int kilometrage;
  final Service service;
  final Vehicule vehicule;
  final String etat;

  Historiquerdv({
    required this.date,
    required this.heure,
    required this.kilometrage,
    required this.service,
    required this.vehicule,
    required this.etat,
  });

  factory Historiquerdv.fromJson(Map<String, dynamic> json) {
    return Historiquerdv(
      date: DateTime.parse(json['date']),
      heure: json['heure'],
      kilometrage: json['kilometrage'],
      service: Service.fromJson(json['service']),
      vehicule: Vehicule.fromJson(json['vehicule']),
      etat: json['etat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'heure': heure,
      'kilometrage': kilometrage,
      'service': service.toJson(),
      'vehicule': vehicule.toJson(),
      'etat': etat,
    };
  }
}
