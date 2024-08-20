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
    final shortName =
        '${info.firstName?[0] ?? ''}${info.lastName?[0] ?? ''}'.toUpperCase();

    return AssigneeEntity(
      userInfo: info,
      displayName: displayName,
      shortName: shortName,
    );
  }

  @override
  List<Object?> get props => [userInfo, shortName, displayName];
}
