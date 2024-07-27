import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sav_project/graphql/graphql_client.dart';
import 'package:sav_project/graphql/queries/notification_queries.dart';

class NotificationService {
  
  Stream<Map<String, dynamic>> subscribeToAppointmentCreated(String role) {
    final SubscriptionOptions options = SubscriptionOptions(
      document: gql(APPOINTMENT_CREATED),
      variables: {
        'role': role,
      },
    );

    final Stream<QueryResult> stream = GraphqlClient.client.value.subscribe(options);
    return stream.map((result) {
      if (result.data == null) {
        throw Exception('No data received');
      }
      final notificationData = result.data!['appointmentCreated'];
      return notificationData;
    });
  }

  Stream<Map<String, dynamic>> subscribeToAppointmentUpdated(String role, String? id) {
    final SubscriptionOptions options = SubscriptionOptions(
      document: gql(APPOINTMENT_UPDATED),
      variables: {
        'role': role,
        'id': id,
      },
    );

    final Stream<QueryResult> stream = GraphqlClient.client.value.subscribe(options);
    return stream.map((result) {
      if (result.data == null) {
        throw Exception('No data received');
      }
      final notificationData = result.data!['appointmentUpdated'];
      return notificationData;
    });
  }
}
