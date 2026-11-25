// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

enum Pages {
  home,
  alarms,
  devices,
  customers,
  assets,
  // The names are the page ids the server sends (AUDIT_LOGS).
  // ignore: constant_identifier_names
  audit_logs,
  notifications,
  // ignore: constant_identifier_names
  device_list,
  dashboards,
  // ignore: constant_identifier_names
  live_location_tracking,
  undefined,
}

Pages pagesFromString(String? value) {
  return Pages.values.firstWhere(
    (e) => e.toString().split('.')[1].toUpperCase() == value?.toUpperCase(),
    orElse: () => Pages.undefined,
  );
}

class PageLayout {
  const PageLayout({
    this.id,
    this.label,
    this.icon,
    this.dashboardId,
    this.path,
    this.url,
  });

  factory PageLayout.fromJson(Map<String, dynamic> json) {
    return PageLayout(
      id: pagesFromString(json['id'] as String?),
      label: json['label'] as String?,
      icon: json['icon'] as String?,
      dashboardId: json['dashboardId'] as String?,
      path: json['path'] as String?,
      url: json['url'] as String?,
    );
  }

  final Pages? id;
  final String? label;
  final String? icon;
  final String? dashboardId;
  final String? path;
  final String? url;
}
