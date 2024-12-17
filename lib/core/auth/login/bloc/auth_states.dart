import 'package:equatable/equatable.dart';
import 'package:thingsboard_app/thingsboard_client.dart' show OAuth2ClientInfo;

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

final class AuthLoadingState extends AuthState {
  const AuthLoadingState();
}

final class AuthDataState extends AuthState {
  const AuthDataState({
    required this.oAuthClients,
  });

  final List<OAuth2ClientInfo> oAuthClients;

  @override
  List<Object?> get props => [oAuthClients];
}
