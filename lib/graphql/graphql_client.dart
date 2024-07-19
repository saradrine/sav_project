import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlClient {
  static final HttpLink httpLink = HttpLink(
    'http://192.168.137.1:3000/graphql',
  );

  static final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: httpLink as Link,
      cache: GraphQLCache(store: InMemoryStore()),

    ),
  );
}