import 'package:sav_project/enum/sexe.dart';
import 'package:sav_project/models/historiqueRDV.dart';
import 'package:sav_project/models/vehicule.dart';

class User {
  final String id;
  final String role;
  final String prenom;
  final String nom;
  final String email;
  final int cin;
  final String telephone;
  final String? adresse;
  final Sexe sexe;
  final DateTime? dateNaissance;
  final String? emploi;
  final List<Vehicule> vehicules;
  final List<Historiquerdv> appointments;
  final bool isVerified = false;

  User({
    required this.id,
    required this.role,
    required this.prenom,
    required this.nom,
    required this.email,
    required this.cin,
    required this.telephone,
    this.adresse,
    required this.sexe,
    this.dateNaissance,
    this.emploi,
    required this.vehicules,
    required this.appointments,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id']?.toString() ?? '0',
      role: json['role'] ?? '',
      prenom: json['prenom'] ?? '',
      nom: json['nom'] ?? '',
      email: json['email'] ?? '',
      cin: json['cin'] ?? 0,
      telephone: json['telephone'] ?? '',
      adresse: json['adresse'],
      sexe: Sexe.values.firstWhere(
          (e) => e.toString() == 'Sexe.${json['sexe']}',
          orElse: () => Sexe.MASCULIN),
      dateNaissance: json['dateNaissance'] != null
          ? DateTime.parse(json['dateNaissance'])
          : DateTime(1970, 1, 1),
      emploi: json['emploi'],
      vehicules: (json['vehicules'] as List<dynamic>?)
              ?.map((item) => Vehicule.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      appointments: (json['appointments'] as List<dynamic>?)
              ?.map((item) =>
                  Historiquerdv.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role': role,
      'prenom': prenom,
      'nom': nom,
      'email': email,
      'cin': cin,
      'telephone': telephone,
      'adresse': adresse,
      'sexe': sexe,
      'dateNaissance': dateNaissance?.toIso8601String(),
      'emploi': emploi,
      'vehicules': vehicules.map((vehicule) => vehicule.toJson()).toList(),
      'appointments':
          appointments.map((appointment) => appointment.toJson()).toList(),
    };
  }
}
