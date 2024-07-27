const APPOINTMENT_CREATED = r'''
    subscription AppointmentCreated($role: String!) {
        appointmentCreated(role: $role) {
            id
            createdAt
            type
            content
            isRead
            receiver {
                id
            }
        }
    }
''';
const APPOINTMENT_UPDATED = r'''
    subscription AppointmentUpdated($role: String!, $id: ID) {
        appointmentUpdated(role: $role, id: $id) {
            id
            type
            createdAt
            content
            isRead
            receiver {
                id
            }
        }
    }
''';

const GET_NOTIFICATIONS = r'''
    query GetNotifications {
        notifications {
            id
            createdAt
            type
            content
            isRead
            isSeen
            receiver {
                id
            }
        }
    }
''';
const MARK_AS_READ = r'''
    mutation MarkAsRead($id: ID!) {
        markAsRead(id: $id) {
            id
        }
    }
''';
const MARK_AS_SEEN = r'''
    mutation MarkAsSeen($id: ID!) {
        markAsSeen(id: $id) {
            id
        }
    }
''';
const DELETE_NOTIFICATION = r'''
    mutation DeleteNotification($id: ID!) {
        removeNotification(id: $id) {
            id
        }
    }
''';
