const String createVehicule = r'''
mutation createVehicule($input: CreateVehiculeInput!) {
  createVehicule(createVehiculeInput: $input) {
    id
    marque
    modele
    numChassis
    type
    immatriculation
    annee
    couleur
    kilometrage
  }
}
''';