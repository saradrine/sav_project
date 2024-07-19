class Vehicule {
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

  Vehicule({
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
  });

  factory Vehicule.fromJson(Map<String, dynamic> json) {
    return Vehicule(
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
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
    };
  }
}
