import 'package:flutter/material.dart';
import 'package:sav_project/models/historiqueRDV.dart';
import 'package:sav_project/theme/colors.dart';
import 'package:sav_project/widgets/home_widgets/upcoming_appointments/upcoming_element.dart';

class UpcomingAppointments extends StatelessWidget {
  final List<Historiquerdv> historiques = [
    Historiquerdv(
      type: 'Vidange',
      state: 'Accepté',
      marque: 'Volkswagon',
      modele: 'Tiguan',
      immatriculation: '218-TUN-7066',
      date: DateTime.parse('2024-06-29'),
      heure: "12:15 PM",
    ),
    Historiquerdv(
      type: 'Vidange',
      state: 'Refusé',
      marque: 'Volkswagon',
      modele: 'Passat',
      immatriculation: '218-TUN-7066',
      date: DateTime.parse('2024-06-29'),
      heure: "12:15 PM",
    ),
    Historiquerdv(
      type: 'Vidange',
      state: 'En cours',
      marque: 'Volkswagon',
      modele: 'Golf',
      immatriculation: '218-TUN-7066',
      date: DateTime.parse('2024-06-29'),
      heure: "12:15 PM",
    ),
    Historiquerdv(
      type: 'Vidange',
      state: 'Annulé',
      marque: 'Volkswagon',
      modele: 'Polo',
      immatriculation: '218-TUN-7066',
      date: DateTime.parse('2024-06-29'),
      heure: "12:15 PM",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'À venir',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Voir historique',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 8),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.31,
            child: ListView.builder(
              itemCount: historiques.length,
              itemBuilder: (context, index) {
                return UpcomingElement(
                  historique: historiques[index],
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
