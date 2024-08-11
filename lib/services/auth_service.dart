import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sav_project/enum/sexe.dart';
import 'package:sav_project/graphql/queries/auth_queries.dart';
import 'package:sav_project/graphql/graphql_client.dart';
import 'package:sav_project/models/user.dart';

class AuthService {
  Future<Map<String, dynamic>> login(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      final MutationOptions options = MutationOptions(
        document: gql(loginMutation),
        variables: {
          'email': email,
          'password': password,
        },
      );

      final QueryResult result =
          await GraphqlClient.client(context).value.mutate(options);

      if (result.hasException) {
        print('Login mutation exception: ${result.exception.toString()}');
        throw result.exception!;
      }

      if (result.data == null || result.data!['login'] == null) {
        throw Exception('No data received from login mutation');
      }

      final loginData = result.data!['login'];
      print('Login Data: $loginData');

      return {
        'accessToken': loginData['accessToken'],
        'user': loginData['user'],
      };
    } catch (e) {
      if (e is GraphQLError) {
        throw Exception('Erreur de connexion: ${e.message}');
      } else {
        throw Exception('Erreur inattendue: $e');
      }
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      final MutationOptions options = MutationOptions(
        document: gql(logoutMutation),
      );
      final QueryResult result =
          await GraphqlClient.client(context).value.mutate(options);
      if (result.hasException) {
        throw result.exception!;
      }
    } catch (e) {
      if (e is GraphQLError) {
        throw Exception('Erreur de déconnexion: ${e.message}');
      } else {
        throw Exception('Erreur inattendue: $e');
      }
    }
  }

  Future<User> registerClient(
    BuildContext context, {
    required String nom,
    required String prenom,
    required String email,
    required String password,
    required int cin,
    required String telephone,
    required String adresse,
    required Sexe sexe,
    required DateTime dateNaissance,
    required String emploi,
  }) async {
    final MutationOptions options = MutationOptions(
      document: gql(registerClientMutation),
      variables: {
        'nom': nom,
        'prenom': prenom,
        'email': email,
        'password': password,
        'cin': cin,
        'telephone': telephone,
        'adresse': adresse,
        'sexe': sexe.toString().split('.').last,
        'dateNaissance': dateNaissance.toIso8601String(),
        'emploi': emploi,
      },
    );

    final QueryResult result =
        await GraphqlClient.client(context).value.mutate(options);

    if (result.hasException) {
      final errorMessage = result.exception!.graphqlErrors.isNotEmpty
          ? result.exception!.graphqlErrors.first.message
          : 'Erreur inattendue';
      throw Exception(errorMessage);
    }

    return User.fromJson(result.data!['registerClient']);
  }

  Future<bool> resetVerificationToken(
    BuildContext context, {
    required String email,
  }) async {
    final MutationOptions options = MutationOptions(
      document: gql(resendVerificationEmailMutation),
      variables: {
        'email': email,
      },
    );

    final QueryResult result =
        await GraphqlClient.client(context).value.mutate(options);

    if (result.hasException) {
      final errorMessage = result.exception!.graphqlErrors.isNotEmpty
          ? result.exception!.graphqlErrors.first.message
          : 'Erreur inattendue';
      throw Exception(errorMessage);
    }

    return true;
  }

  Future<bool> verifyEmail(
    BuildContext context, {
    required String token,
    required String email,
  }) async {
    final MutationOptions options = MutationOptions(
      document: gql(verifyAccountMutation),
      variables: {
        'token': token,
        'email': email,
      },
    );

    final QueryResult result =
        await GraphqlClient.client(context).value.mutate(options);

    if (result.hasException) {
      final errorMessage = result.exception!.graphqlErrors.isNotEmpty
          ? result.exception!.graphqlErrors.first.message
          : 'Erreur inattendue';
      throw Exception(errorMessage);
    }

    final isVerified = result.data?['verifyEmail'] == true;
    return isVerified;
  }

  Future<void> forgotPassword(
    BuildContext context, {
    required String email,
  }) async {
    final MutationOptions options = MutationOptions(
      document: gql(forgotPasswordMutation),
      variables: {
        'email': email,
      },
    );

    final QueryResult result =
        await GraphqlClient.client(context).value.mutate(options);

    if (result.hasException) {
      final errorMessage = result.exception!.graphqlErrors.isNotEmpty
          ? result.exception!.graphqlErrors.first.message
          : 'Erreur inattendue';
      throw Exception(errorMessage);
    }
  }

  Future<bool> resetPassword(
    BuildContext context, {
    required String token,
    required String password,
    required String confirmPassword,
  }) async {
    final MutationOptions options = MutationOptions(
      document: gql(resetPasswordMutation),
      variables: {
        'token': token,
        'password': password,
        'confirmPassword': confirmPassword,
      },
    );

    final QueryResult result =
        await GraphqlClient.client(context).value.mutate(options);

    if (result.hasException) {
      final errorMessage = result.exception!.graphqlErrors.isNotEmpty
          ? result.exception!.graphqlErrors.first.message
          : 'Erreur inattendue';
      throw Exception(errorMessage);
    }

    final isReset = result.data?['resetPassword'] == true;
    return isReset;
  }
}
