import 'package:thingsboard_app/utils/usecase.dart';

class UserDetailsUseCase extends UseCase<UserDetailsOutput, UserDetailsParams> {
  const UserDetailsUseCase();
String cleanName(String name) {
  final val = name.trim().replaceAll(RegExp(r'\s+'), ' ');
  return val;
}
  @override
  UserDetailsOutput call(UserDetailsParams params) {
    final name = cleanName('${params.firstName ?? ''} ${params.lastName ?? ''}') ;
    final displayName = name.length > 1 ? name : params.email;

    String shortName = '';
    if (params.firstName?.isNotEmpty == true) {
      shortName = params.firstName?[0] ?? '';
    }
    if (params.lastName?.isNotEmpty == true) {
      shortName += params.lastName?[0] ?? '';
    }

    if (shortName.isEmpty) {
      shortName = params.email[0];
    }

    return UserDetailsOutput(
      shortName: shortName.toUpperCase(),
      displayName: displayName,
    );
  }
}

final class UserDetailsParams {
  const UserDetailsParams({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  final String? firstName;
  final String? lastName;
  final String email;
}

final class UserDetailsOutput {
  const UserDetailsOutput({
    required this.shortName,
    required this.displayName,
  });

  final String shortName;
  final String displayName;
}
