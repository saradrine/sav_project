import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sav_project/graphql/graphql_client.dart';
import 'package:sav_project/graphql/queries/vehicle_queries.dart';

class VehicleService {
  Future<Map<String, dynamic>?> createVehicle(
      BuildContext context, Map<String, dynamic> input) async {
    final MutationOptions options = MutationOptions(
      document: gql(createVehicule),
      variables: {
        'input': input,
      },
    );

    final QueryResult result =
        await GraphqlClient.client(context).value.mutate(options);

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

  Future<Map<String, dynamic>?> updateVehicle(
      BuildContext context, Map<String, dynamic> updateVehiculeInput, String id) async {
    final MutationOptions options = MutationOptions(
      document: gql(updateVehicule),
      variables: {
        'updateVehiculeInput': updateVehiculeInput,
        'id': id,
      },
    );

    final QueryResult result =
        await GraphqlClient.client(context).value.mutate(options);

    if (result.hasException) {
      print('Error: ${result.exception.toString()}');
      throw Exception(result.exception.toString());
    }
    final vehicleData = result.data?['updateVehicule'];
    if (vehicleData == null) {
      print('Vehicle data is null');
      return null;
    }

    print('Vehicle data: $vehicleData');
    return vehicleData;
  }
}
