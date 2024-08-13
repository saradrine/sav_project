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

const String registerClientMutation = r'''
mutation registerClient($nom: String!, $prenom: String!, $email: String!, $password: String!, $cin: Int!, $telephone: String!, $adresse: String!, $sexe: Sexe!, $dateNaissance: DateTime!, $emploi: String!) {
  registerClient(userData: {
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

const String resendVerificationEmailMutation = r'''
mutation resetVerificationToken($email: String!) {
  resetVerificationToken(email: $email)
}
''';

const String verifyAccountMutation = r'''
mutation verifyEmail($token: String!, $email: String!) {
  verifyEmail(token: $token, email: $email) 
}
''';

const String forgotPasswordMutation = r'''
mutation forgotPassword($email: String!) {
  forgotPassword(email: $email)
}
''';

const String resetPasswordMutation = r'''
mutation resetPassword($token: String!, $password: String!, $confirmPassword: String!) {
  resetPassword(token: $token, password: $password, confirmPassword: $confirmPassword)
}
''';