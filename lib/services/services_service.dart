import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sav_project/graphql/queries/service_queries.dart';
import 'package:sav_project/models/service.dart';
import 'package:sav_project/graphql/graphql_client.dart';

class ServicesService {
  Future<List<Service>> fetchServices() async {
    final QueryOptions options = QueryOptions(
      document: gql(getServices),
    );

    final QueryResult result = await GraphqlClient.client.value.query(options);

    if (result.hasException) {
      print('Error: ${result.exception.toString()}');
      throw Exception(result.exception.toString());
    }
    print('Services: ${result.data!['services']}');
    final services = result.data!['services'];
    return List<Service>.from(
      services.map((service) => Service.fromJson(service)),
    );
  }
}
