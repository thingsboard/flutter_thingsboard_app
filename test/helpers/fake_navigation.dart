// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/modules/main/domain/models/navigation_state.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';

/// A [Navigation] with no bottom bar or "More" pages. When [homePath] is
/// given, [resolveHomePath] returns it instead of resolving one.
class NoPagesNavigation extends Navigation {
  NoPagesNavigation({this.homePath});

  final String? homePath;

  @override
  NavigationState build() =>
      const NavigationState(bottomBarPages: [], morePages: []);

  @override
  String? resolveHomePath() => homePath ?? super.resolveHomePath();
}
