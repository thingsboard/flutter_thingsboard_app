import 'package:equatable/equatable.dart';
import 'package:thingsboard_app/thingsboard_client.dart' show PlatformType;

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

final class AuthFetchEvent extends AuthEvent {
  const AuthFetchEvent({
    required this.packageName,
    required this.platformType,
  });

  final String packageName;
  final PlatformType platformType;

  @override
  List<Object?> get props => [packageName, platformType];
}
