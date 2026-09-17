enum Pages {
  home,
  alarms,
  devices,
  customers,
  assets,
  audit_logs,
  notifications,
  device_list,
  dashboards,
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

  final Pages? id;
  final String? label;
  final String? icon;
  final String? dashboardId;
  final String? path;
  final String? url;

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
}
