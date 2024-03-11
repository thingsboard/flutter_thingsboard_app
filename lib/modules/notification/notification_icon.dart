import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thingsboard_app/modules/notification/notification_model.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    final iconData = _toIcon(notification.message.data['icon.icon']);
    final color = _toColor(notification.message.data['icon.color']);

    return Icon(iconData, color: color);
  }

  Color _toColor(String? data) {
    if (data != null) {
      var hexColor = data.replaceAll("#", "");
      if (hexColor.length == 6) {
        hexColor = "FF" + hexColor;
      }

      if (hexColor.length == 8) {
        final value = int.tryParse('0x$hexColor');
        if (value != null) {
          return Color(value);
        }
      }
    }

    return Colors.black54;
  }

  IconData _toIcon(String? data) {
    if (data != null) {
      return MdiIcons.fromString(data) ?? Icons.notifications;
    }

    return Icons.notifications;
  }
}
