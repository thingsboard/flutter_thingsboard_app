import 'package:equatable/equatable.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

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

    return AssigneeEntity(
      userInfo: info,
      displayName: displayName,
      shortName: displayName.split(' ').map((e) => e[0]).join('').toUpperCase(),
    );
  }

  @override
  List<Object?> get props => [userInfo, shortName, displayName];
}
