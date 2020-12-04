import 'package:mowgli/ui/screens/alerts/history/bloc/alerts_notification_model.dart';

class AlertsHistoryContent {
  final Iterable<NotificationItem> notifications;

  AlertsHistoryContent(this.notifications);

  bool get isEmpty => notifications.isEmpty;
}
