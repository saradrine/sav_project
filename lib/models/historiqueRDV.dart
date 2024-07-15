class Historiquerdv {
  final String type;
  final String state;
  final String marque;
  final String modele;
  final String immatriculation;
  final DateTime date;
  final String? heure;

  Historiquerdv({
    required this.type,
    required this.state,
    required this.marque,
    required this.modele,
    required this.immatriculation,
    required this.date,
    this.heure,
  });
}
