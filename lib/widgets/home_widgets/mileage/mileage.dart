import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sav_project/theme/colors.dart';
import 'package:sav_project/models/vehicule.dart';
import 'package:sav_project/widgets/home_widgets/mileage/mileage_element.dart';

class Mileage extends StatelessWidget {
  final List<Vehicule> vehicules = [
    Vehicule(
      marque: 'Volkswagon',
      modele: 'Tiguan',
      type: 'Voiture',
      numChassis: '3VWDD21C8YM448564',
      immatriculation: '218-TUN-7066',
      annee: '2015',
      couleur: 'Noir',
      kilometrage: 100000,
      IntervalKilometrage: 15000,
      dernierVidange: 95000,
    ),
    Vehicule(
      marque: 'Volkswagon',
      modele: 'Passat',
      type: 'Voiture',
      numChassis: '3VWDD21C8YM548564',
      immatriculation: '218-TUN-7066',
      annee: '2015',
      couleur: 'Blanc',
      kilometrage: 100000,
      IntervalKilometrage: 15000,
      dernierVidange: 95000,
    ),
    Vehicule(
      marque: 'Volkswagon',
      modele: 'Polo',
      type: 'Voiture',
      numChassis: '3VWDD21C8YM448564',
      immatriculation: '218-TUN-7066',
      annee: '2015',
      couleur: 'Rouge',
      kilometrage: 100000,
      IntervalKilometrage: 15000,
      dernierVidange: 95000,
    ),
    Vehicule(
      marque: 'Volkswagon',
      modele: 'Polo',
      type: 'Voiture',
      numChassis: '3VWDD21C8YM448564',
      immatriculation: '218-TUN-7066',
      annee: '2015',
      couleur: 'Rouge',
      kilometrage: 100000,
      IntervalKilometrage: 15000,
      dernierVidange: 95000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Text(
            'Véhicules et kilométrage',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: CarouselSlider.builder(
            itemCount: vehicules.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return MileageElement(
                vehicule: vehicules[index],
              );
            },
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.22,
              viewportFraction: 0.85,
              aspectRatio: 2.0,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              padEnds: false,
              onPageChanged: (index, reason) {
                // Handle page change
              },
            ),
          ),
        ),
      ],
    );
  }
}
