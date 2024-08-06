import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:sav_project/providers/auth_provider.dart';

class GraphqlClient {
  static final HttpLink httpLink = HttpLink(
    'http://192.168.1.166:3000/graphql',
  );
  static final WebSocketLink webSocketLink =
      WebSocketLink(dotenv.env['WS_URL'] ?? 'ws://localhost:3000/graphql');

  static AuthLink authLink(BuildContext context) => AuthLink(
        getToken: () async {
          try {
            final authProvider =
                Provider.of<AuthProvider>(context, listen: false);
            final token = authProvider.token;
            if (token == null) {
              print('User is not logged in.');
              return null;
            }
            return 'Bearer $token';
          } catch (e) {
            print('Error retrieving token: $e');
            return null;
          }
        },
      );

  static Link link(BuildContext context) => Link.split(
        (request) => request.isSubscription,
        webSocketLink,
        authLink(context).concat(httpLink),
      );

  static ValueNotifier<GraphQLClient> client(BuildContext context) =>
      ValueNotifier<GraphQLClient>(
        GraphQLClient(
          link: link(context),
          cache: GraphQLCache(store: InMemoryStore()),
        ),
      );
}
