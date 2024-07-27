import 'service.dart';
import 'vehicule.dart';

class Historiquerdv {
  final int id;
  final DateTime date;
  final String heure;
  final int? kilometrage;
  final Service? service;
  final Vehicule? vehicule;
  final String? etat;

  Historiquerdv({
    required this.id,
    required this.date,
    required this.heure,
    this.kilometrage,
    this.service,
    this.vehicule,
    this.etat,
  });

  factory Historiquerdv.fromJson(Map<String, dynamic> json) {
    return Historiquerdv(
      id: int.parse(json['id']),
      date: DateTime.parse(json['date']),
      heure: json['heure'] ?? '',
      kilometrage: json['kilometrage'],
      service: json['service'] != null ? Service.fromJson(json['service']) : null,
      vehicule: json['vehicule'] != null ? Vehicule.fromJson(json['vehicule']) : null,
      etat: json['etat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'heure': heure,
      'kilometrage': kilometrage,
      'service': service?.toJson(),
      'vehicule': vehicule?.toJson(),
      'etat': etat,
    };
  }
}
