import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationModel {
  const NotificationModel({required this.message, this.read = false});

  final RemoteMessage message;
  final bool read;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        message: RemoteMessage.fromMap(json['message']),
        read: json['read'] as bool,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message.toMap(),
        'read': read,
      };

  NotificationModel copyWith({
    RemoteMessage? message,
    bool? read,
  }) =>
      NotificationModel(
        message: message ?? this.message,
        read: read ?? this.read,
      );
}
