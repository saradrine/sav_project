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

const String updateVehicule = r'''
mutation updateVehicule($updateVehiculeInput: UpdateVehiculeInput!, $id: string!) {
  updateVehicule(updateVehiculeInput: $updateVehiculeInput, id: $id) {
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
