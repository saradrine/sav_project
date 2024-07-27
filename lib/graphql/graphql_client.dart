import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GraphqlClient {
  static final HttpLink httpLink = HttpLink(
    dotenv.env['API_URL'] ?? 'http://192.168.1.5:3000/graphql',
  );
  static final WebSocketLink webSocketLink =
      WebSocketLink(dotenv.env['WS_URL'] ?? 'ws://localhost:3000/graphql');

static final Link link = Link.split((request) => request.isSubscription, webSocketLink, httpLink);

  static final ValueNotifier<GraphQLClient> client =
      ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );
}
