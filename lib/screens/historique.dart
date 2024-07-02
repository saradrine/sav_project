import 'package:flutter/material.dart';
import 'package:sav_project/models/historiqueRDV.dart';
import '../widgets/historique_element.dart';

class Historique extends StatefulWidget {
  const Historique({super.key});

  @override
  State<Historique> createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  List<Historiquerdv> historiques = [
    Historiquerdv(
        type: 'Vidange',
        state: 'Accepté',
        marque: 'Volkswagon',
        modele: 'Tiguan',
        immatriculation: '218-TUN-7066',
        date: DateTime.parse('2024-06-29 12:15:00')),
    Historiquerdv(
        type: 'Vidange',
        state: 'Refusé',
        marque: 'Volkswagon',
        modele: 'Passat',
        immatriculation: '218-TUN-7066',
        date: DateTime.parse('2024-06-29 12:15:00')),
    Historiquerdv(
        type: 'Vidange',
        state: 'En cours',
        marque: 'Volkswagon',
        modele: 'Golf',
        immatriculation: '218-TUN-7066',
        date: DateTime.parse('2024-06-29 12:15:00')),
    Historiquerdv(
        type: 'Vidange',
        state: 'Annulé',
        marque: 'Volkswagon',
        modele: 'Polo',
        immatriculation: '218-TUN-7066',
        date: DateTime.parse('2024-06-29 12:15:00')),
  ];

  void onDismissed(Historiquerdv historique) {
    setState(() {
      historiques.remove(historique);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 16),
        child: historiques.isEmpty
            ? Center(
                child: Text(
                  "Vous n'avez encore aucun historique.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 131, 130, 130),
                  ),
                ),
              )
            : ListView.builder(
                itemCount: historiques.length,
                itemBuilder: (context, index) {
                  return HistoriqueElement(
                    historique: historiques[index],
                    onDismissed: onDismissed,
                  );
                },
              ),
      ),
    );
  }
}
