const String getClientById = r'''
query client($id: ID!) {
  client(id: $id) {
    role
    nom
    prenom
    email
    cin
    telephone
    adresse
    sexe
    dateNaissance
    emploi
    vehicules {
    marque
    modele
    numChassis
    type
    immatriculation
    annee
    couleur
    kilometrage
    }
    appointments {
      service {
        name
      } 
      date 
      heure 
      kilometrage 
      etat 
      vehicule {
        marque 
        modele 
        numChassis
      }
    }
  }
}
''';


