// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/alarm/domain/repository/alarm_types/i_alarm_types_repository.dart';
import 'package:thingsboard_app/utils/usecase.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class FetchAlarmTypesUseCase
    extends UseCase<Future<PageData<EntitySubtype>>, PageLink> {
  const FetchAlarmTypesUseCase({required this.repository});

  final IAlarmTypesRepository repository;

  @override
  Future<PageData<EntitySubtype>> call(PageLink params) {
    return repository.fetchAlarmTypes(params);
  }
}
