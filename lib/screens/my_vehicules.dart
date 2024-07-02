import 'package:flutter/material.dart';
import 'package:sav_project/models/vehicule.dart';
import '../widgets/vehicule_element.dart';
import '../widgets/button.dart';
import 'package:sav_project/screens/layout.dart';

class MyVehicules extends StatefulWidget {
  const MyVehicules({super.key});

  @override
  State<MyVehicules> createState() => _MyVehiculesState();
}

class _MyVehiculesState extends State<MyVehicules> {
  List<Vehicule> vehicules = [
    Vehicule(
      marque: 'Volkswagon',
      modele: 'Tiguan',
      type: 'Voiture',
      numChassis: '3VWDD21C8YM448564',
      immatriculation: '218-TUN-7066',
      annee: '2015',
      couleur: 'Noir',
    ),
    Vehicule(
      marque: 'Volkswagon',
      modele: 'Passat',
      type: 'Voiture',
      numChassis: '3VWDD21C8YM548564',
      immatriculation: '218-TUN-7066',
      annee: '2015',
      couleur: 'Blanc',
    ),
    Vehicule(
      marque: 'Volkswagon',
      modele: 'Polo',
      type: 'Voiture',
      numChassis: '3VWDD21C8YM448564',
      immatriculation: '218-TUN-7066',
      annee: '2015',
      couleur: 'Rouge',
    ),
    Vehicule(
      marque: 'Volkswagon',
      modele: 'Polo',
      type: 'Voiture',
      numChassis: '3VWDD21C8YM448564',
      immatriculation: '218-TUN-7066',
      annee: '2015',
      couleur: 'Rouge',
    ),
  ];

  void onDismissed(Vehicule vehicule) {
    setState(() {
      vehicules.remove(vehicule);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 15.0),
                child: ButtonStyled(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Layout(initialIndex: 2),
                      ),
                    );
                  },
                  textColor: Colors.white,
                  backgroundColor: Color(0xFF039388),
                  text: 'Ajouter véhicule',
                ),
              ),
            ],
          ),
          vehicules.isEmpty
              ? Center(
                  child: Text(
                    "Vous n'avez encore ajouté aucune voiture.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 131, 130, 130),
                    ),
                  ),
                )
              : Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 16,
                    ),
                    child: ListView.builder(
                      itemCount: vehicules.length,
                      itemBuilder: (context, index) {
                        return VehiculeElement(
                          vehicule: vehicules[index],
                          onDismissed: onDismissed,
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
