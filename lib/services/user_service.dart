import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sav_project/graphql/queries/user_queries.dart';
import 'package:sav_project/models/user.dart';
import 'package:sav_project/graphql/graphql_client.dart';

class UserService {
  Future<User> fetchUserById(BuildContext context, String id) async {
    final QueryOptions options = QueryOptions(
      document: gql(getClientById),
      variables: {
        'id': id,
      },
    );

    final QueryResult result =
        await GraphqlClient.client(context).value.query(options);

    if (result.hasException) {
      print('Error: ${result.exception.toString()}');
      throw Exception(result.exception.toString());
    }
    print('User data: ${result.data!['client']}');
    final userData = result.data!['client'];
    return User.fromJson(userData);
  }
}
