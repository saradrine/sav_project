const String loginMutation = r'''
mutation login($email: String!, $password: String!) {
  login(credentials: {
    email: $email,
    password: $password,
  }) {
    user {
      id
      prenom
      email
      role
    }
    accessToken
  }
}
''';

const String logoutMutation = r'''
mutation logout {
  logout
}
''';

const String registerSuperAdminMutation = r'''
mutation registerSuperAdmin($nom: String!, $prenom: String!, $email: String!, $password: String!, $cin: Int!, $telephone: String!, $adresse: String!, $sexe: Sexe!, $dateNaissance: DateTime!, $emploi: String!) {
  registerSuperAdmin(userData: {
    nom: $nom,
    prenom: $prenom,
    email: $email,
    password: $password,
    cin: $cin,
    telephone: $telephone,
    adresse: $adresse,
    sexe: $sexe,
    dateNaissance: $dateNaissance,
    emploi: $emploi,
  }) {
    id
    nom
    prenom
    email
    cin
    role
  }
}
''';
