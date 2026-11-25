// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_client/thingsboard_client.dart';

/// Page keys for the alarm lists: `PageKeyController<P>` needs one key object,
/// while the generated client takes flat parameters, so the datasources unpack
/// these.
class AlarmQueryV2 {
  AlarmQueryV2(
    this.pageLink, {
    this.affectedEntityId,
    this.typeList,
    this.statusList,
    this.severityList,
    this.assigneeId,
  });

  EntityId? affectedEntityId;
  TimePageLink pageLink;
  List<String>? typeList;
  List<AlarmSearchStatus>? statusList;
  List<AlarmSeverity>? severityList;
  UserId? assigneeId;
}

class AlarmCommentsQuery {
  const AlarmCommentsQuery({required this.pageLink, required this.id});

  final PageLink pageLink;
  final AlarmId id;
}

class UsersAssignQuery {
  const UsersAssignQuery({required this.pageLink, required this.id});

  final PageLink pageLink;
  final AlarmId id;
}
