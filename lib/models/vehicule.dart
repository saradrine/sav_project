class Vehicule {
  final String marque;
  final String modele;
  final String type;
  final String numChassis;
  final String immatriculation;
  final String annee;
  final String couleur;
  final int kilometrage;
  final int IntervalKilometrage;
  final int? dernierVidange;

  Vehicule({
    required this.marque,
    required this.modele,
    required this.type,
    required this.numChassis,
    required this.immatriculation,
    required this.annee,
    required this.couleur,
    required this.kilometrage,
    required this.IntervalKilometrage,
    this.dernierVidange,
  });
}
