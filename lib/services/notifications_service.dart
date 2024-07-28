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

  Future<List<Map<String, dynamic>>> getAllNotifications() async {
    final QueryOptions options = QueryOptions(
      document: gql(GET_NOTIFICATIONS),
    );

    final QueryResult result = await GraphqlClient.client.value.query(options);

    if (result.hasException) {
      print('Error: ${result.exception.toString()}');
      throw Exception(result.exception.toString());
    }
    
    final notifications = (result.data!['notifications'] as List)
        .map((notification) => notification as Map<String, dynamic>)
        .toList();

    return notifications;
  }
    Future<void> deleteNotification(String id) async {
    final MutationOptions options = MutationOptions(
      document: gql(DELETE_NOTIFICATION),
      variables: {
        'id': id,
      },
    );

    final QueryResult result = await GraphqlClient.client.value.mutate(options);

    if (result.hasException) {
      print('Error: ${result.exception.toString()}');
      throw Exception(result.exception.toString());
    }

    final deletedNotification = result.data!['removeNotification'];
    print('Deleted notification with id: ${deletedNotification['id']}');
  }

  Future<void> markAsRead(String id) async {
    final MutationOptions options = MutationOptions(
      document: gql(MARK_AS_READ),
      variables: {
        'id': id,
      },
    );

    final QueryResult result = await GraphqlClient.client.value.mutate(options);

    if (result.hasException) {
      print('Error: ${result.exception.toString()}');
      throw Exception(result.exception.toString());
    }

    final markedNotification = result.data!['markAsRead'];
    print('Marked notification as read with id: ${markedNotification['id']}');
  }
  
  Future<void> markAsSeen(String id) async {
    final MutationOptions options = MutationOptions(
      document: gql(MARK_AS_SEEN),
      variables: {
        'id': id,
      },
    );

    final QueryResult result = await GraphqlClient.client.value.mutate(options);

    if (result.hasException) {
      print('Error: ${result.exception.toString()}');
      throw Exception(result.exception.toString());
    }

    final markedNotification = result.data!['markAsSeen'];
    print('Marked notification as seen with id: ${markedNotification['id']}');
  }
}
