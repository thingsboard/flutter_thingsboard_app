import 'package:thingsboard_client/thingsboard_client.dart';

/// Page key for the notification list (`PageKeyController` needs a single key
/// object; the generated `getNotifications` takes flat parameters).
class NotificationQuery {
  NotificationQuery(this.pageLink, {this.unreadOnly = false});

  final PageLink pageLink;
  bool unreadOnly;
}
