import 'package:sav_project/models/historiqueRDV.dart';

class Vehicule {
  final int id;
  final String? marque;
  final String? modele;
  final String? type;
  final String? numChassis;
  final String? immatriculation;
  final String? annee;
  final String? couleur;
  final int? kilometrage;
  final int? intervalKilometrage;
  final int? dernierVidange;
  final List<Historiquerdv> appointments; 

  Vehicule({
    required this.id,
    required this.marque,
    required this.modele,
    required this.type,
    required this.numChassis,
    required this.immatriculation,
    required this.annee,
    required this.couleur,
    required this.kilometrage,
    this.intervalKilometrage,
    this.dernierVidange,
    required this.appointments,
  });

  factory Vehicule.fromJson(Map<String, dynamic> json) {
    return Vehicule(
      id: int.parse(json['id']),
      marque: json['marque'],
      modele: json['modele'],
      type: json['type'],
      numChassis: json['numChassis'],
      immatriculation: json['immatriculation'],
      annee: json['annee'],
      couleur: json['couleur'],
      kilometrage: json['kilometrage'],
      intervalKilometrage: json['intervalKilometrage'],
      dernierVidange: json['dernierVidange'],
      appointments: (json['appointments'] as List<dynamic>?)
        ?.map((item) => Historiquerdv.fromJson(item as Map<String, dynamic>))
        .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'marque': marque,
      'modele': modele,
      'type': type,
      'numChassis': numChassis,
      'immatriculation': immatriculation,
      'annee': annee,
      'couleur': couleur,
      'kilometrage': kilometrage,
      'intervalKilometrage': intervalKilometrage,
      'dernierVidange': dernierVidange,
      'appointments': appointments.map((appointment) => appointment.toJson()).toList(),

    };
  }
}
