import 'package:flutter/material.dart';

class HistoriqueScreen extends StatefulWidget {
  const HistoriqueScreen({super.key});

  @override
  State<HistoriqueScreen> createState() => _HistoriqueScreenState();
}

class _HistoriqueScreenState extends State<HistoriqueScreen> {
  final List<dynamic> historiqueData = [];

  @override
  Widget build(BuildContext context) {
    Widget contentWidget;
    if (historiqueData.isEmpty) {
      contentWidget = Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            "Vous n'avez encore aucun historique.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: const Color.fromARGB(255, 131, 130, 130),
            ),
          ),
        ),
      );
    } else {
      contentWidget = Column(
        children: historiqueData.map((data) => HistoriqueElement()).toList(),
      );
    }
    return Scaffold(
      backgroundColor: Color(0xFFF6F8FB),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: contentWidget,
        ),
      ),
    );
  }
}

class HistoriqueElement extends StatelessWidget {
  const HistoriqueElement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Vidange',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Accepté'),
            ],
          ),
          Row(
            children: [
              Text('Véhicule:  '),
              Text('Volkswagon - Tiguan'),
            ],
          ),
          Row(
            children: [
              Text('218-TUN-7066'),
            ],
          ),
          Row(
            children: [
              Text('Le 12/10/2024 à 13:00'),
            ],
          ),
        ],
      ),
    );
  }
}
