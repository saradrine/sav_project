const String getClientById = r'''
query client($id: ID!) {
  client(id: $id) {
    id
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
    id
    marque
    modele
    numChassis
    type
    immatriculation
    annee
    couleur
    kilometrage
    appointments {
      id
      service {
        id
        name
      }
      date
      heure
    }
  }
    appointments {
      id
      service {
        id
        name
      } 
      date 
      heure 
      kilometrage 
      etat 
      vehicule {
        id
        marque 
        modele 
        numChassis
      }
    }
  }
}
''';


