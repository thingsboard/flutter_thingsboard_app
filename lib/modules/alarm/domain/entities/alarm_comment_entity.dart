import 'package:thingsboard_client/thingsboard_client.dart';

class AlarmCommentEntity {
  const AlarmCommentEntity(this.commentInfo, {required this.canEdit});

  final AlarmCommentInfo commentInfo;
  final bool canEdit;
}
