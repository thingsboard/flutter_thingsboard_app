import 'package:equatable/equatable.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AssigneeEntity extends Equatable {
  const AssigneeEntity({
    required this.userInfo,
    required this.shortName,
    required this.displayName,
  });

  final UserInfo userInfo;
  final String shortName;
  final String displayName;

  factory AssigneeEntity.fromUserInfo(UserInfo info) {
    final name = '${info.firstName ?? ''} ${info.lastName ?? ''}';
    final displayName = name.length > 1 ? name : info.email;

    String shortName = '';
    if (info.firstName?.isNotEmpty == true) {
      shortName = info.firstName?[0] ?? '';
    }
    if (info.lastName?.isNotEmpty == true) {
      shortName += info.lastName?[0] ?? '';
    }

    if (shortName.isEmpty) {
      shortName = info.email[0];
    }

    return AssigneeEntity(
      userInfo: info,
      displayName: displayName,
      shortName: shortName.toUpperCase(),
    );
  }

  @override
  List<Object?> get props => [userInfo, shortName, displayName];
}
