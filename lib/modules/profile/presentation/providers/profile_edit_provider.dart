// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/domain/usecases/fetch_dashboards_usecase.dart';
import 'package:thingsboard_client/thingsboard_client.dart';
part 'profile_edit_provider.g.dart';

@riverpod
class ProfileEditProvider extends _$ProfileEditProvider {
  final dashboardsUseCase = getIt<FetchDashboardsUseCase>();
  @override
  ProfileEditState build() {
    loadData();
    return ProfileEditState(dashboards: [], isLoading: true);
  }

  Future<void> loadData() async {
    state = ProfileEditState(dashboards: [], isLoading: true);

    // _tbClient.getDashboardService().getCustomerDashboards(customerId, pageLink)
  }
}

class ProfileEditState {
  ProfileEditState({required this.dashboards, required this.isLoading});

  final List<DashboardInfo> dashboards;
  final bool isLoading;
}
