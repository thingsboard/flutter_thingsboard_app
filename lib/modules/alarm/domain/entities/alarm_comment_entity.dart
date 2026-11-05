import 'package:thingsboard_app/thingsboard_client.dart';

class AlarmCommentEntity {
  const AlarmCommentEntity(this.commentInfo, {required this.canEdit});

  final AlarmCommentInfo commentInfo;
  final bool canEdit;
}
