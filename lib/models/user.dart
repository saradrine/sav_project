import 'package:sav_project/models/historiqueRDV.dart';
import 'package:sav_project/models/vehicule.dart';

class User {
  final int id;
  final String role;
  final String firstName;
  final String lastName;  
  final String email;
  final int cin;
  final String phone;
  final String address; 
  final String sexe;
  final DateTime birthDate; 
  final String job; 
  final List<Vehicule> vehicules;
  final List<Historiquerdv> appointments;


  User({
    required this.id,
    required this.role,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.cin,
    required this.phone,
    required this.address,
    required this.sexe,
    required this.birthDate,
    required this.job,
    required this.vehicules,
    required this.appointments, 
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: int.parse(json['id']),
      role: json['role'],
      firstName: json['prenom'],
      lastName: json['nom'],
      email: json['email'],
      cin: json['cin'],
      phone: json['telephone'],
      address: json['adresse'],
      sexe: json['sexe'],
      birthDate: DateTime.parse(json['dateNaissance']),
      job: json['emploi'],
      vehicules: (json['vehicules'] as List<dynamic>)
          .map((item) => Vehicule.fromJson(item as Map<String, dynamic>))
          .toList(),
      appointments: (json['appointments'] as List<dynamic>?)
          ?.map((item) => Historiquerdv.fromJson(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role': role,
      'prenom': firstName,
      'nom': lastName,
      'email': email,
      'cin': cin,
      'telephone': phone,
      'adresse': address,
      'sexe': sexe,
      'dateNaissance': birthDate.toIso8601String(),
      'emploi': job,
      'vehicules': vehicules.map((vehicule) => vehicule.toJson()).toList(),
      'appointments': appointments.map((appointment) => appointment.toJson()).toList(),
    };
  }
}
