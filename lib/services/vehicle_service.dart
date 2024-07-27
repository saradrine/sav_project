import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sav_project/graphql/graphql_client.dart';
import 'package:sav_project/graphql/queries/vehicle_queries.dart';

class VehicleService {
  Future<Map<String, dynamic>?> createVehicle(Map<String, dynamic> input) async {
    final MutationOptions options = MutationOptions(
      document: gql(createVehicule),
      variables: {
        'input': input,
      },
    );

    final QueryResult result = await GraphqlClient.client.value.mutate(options);

    if (result.hasException) {
      print('Error: ${result.exception.toString()}');
      throw Exception(result.exception.toString());
    }
    final vehicleData = result.data?['createVehicule'];
    if (vehicleData == null) {
      print('Vehicle data is null');
      return null;
    }

    print('Vehicle data: $vehicleData');
    return vehicleData;
  }
}
