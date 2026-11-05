// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/asset_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/customer_routes.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/dashboard_routes.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/device/presentation/device_dashboard_navigation.dart';
import 'package:thingsboard_app/modules/location_tracking/application/live_tracking_display.dart';
import 'package:thingsboard_app/modules/location_tracking/domain/models/last_tracking_record.dart';
import 'package:thingsboard_app/modules/location_tracking/domain/models/live_tracking_config.dart';
import 'package:thingsboard_app/modules/location_tracking/domain/models/live_tracking_error.dart';
import 'package:thingsboard_app/modules/location_tracking/domain/models/live_tracking_session.dart';
import 'package:thingsboard_app/modules/location_tracking/presentation/providers/live_tracking_provider.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

class LiveTrackingPage extends ConsumerWidget {
  const LiveTrackingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(liveTrackingProvider).session;
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).liveTrackingSessionTitle)),
      body: session != null ? _ActiveSession(session: session) : _IdleView(),
    );
  }
}

final _sessionTimeFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

String _formatSessionTime(DateTime time) =>
    _sessionTimeFormat.format(time.toLocal());

TextStyle _linkStyle(BuildContext context) {
  final color = Theme.of(context).colorScheme.primary;
  return TextStyle(
    color: color,
    decoration: TextDecoration.underline,
    decorationColor: color,
  );
}

String _errorLabel(
  BuildContext context,
  LiveTrackingError error,
) => switch (error) {
  LiveTrackingError.targetNotFound =>
    S.of(context).liveTrackingErrorTargetNotFound,
  LiveTrackingError.noConnection => S.of(context).liveTrackingErrorNoConnection,
  LiveTrackingError.unauthorized => S.of(context).liveTrackingErrorUnauthorized,
  LiveTrackingError.savePermissionDenied =>
    S.of(context).liveTrackingErrorSavePermissionDenied,
  LiveTrackingError.saveFailed => S.of(context).liveTrackingErrorSaveFailed,
  LiveTrackingError.locationServicesDisabled =>
    S.of(context).liveTrackingErrorServicesDisabled,
  LiveTrackingError.locationPermissionDenied =>
    S.of(context).liveTrackingErrorPermissionDenied,
  LiveTrackingError.locationPermissionDeniedForever =>
    S.of(context).liveTrackingErrorPermissionDeniedForever,
  LiveTrackingError.locationError => S.of(context).liveTrackingErrorLocation,
};

/// How to open a tracking target, or `null` when its entity type has no
/// details page in the app. Linkability and navigation come from this one
/// function so a newly supported target type cannot end up link-styled with
/// no handler, or handled while still rendering as plain text.
VoidCallback? _targetTapHandler(
  BuildContext context,
  WidgetRef ref,
  LiveTrackingTarget target,
) => switch (target.entityType) {
  'ASSET' => () => context.push('${AssetRoutes.asset}/${target.id}'),
  'CUSTOMER' =>
    () => context.push(
      '${CustomerRoutes.customers}${CustomerRoutes.customer}/${target.id}',
    ),
  'DEVICE' => () => _openDeviceTarget(ref, target.id),
  _ => null,
};

/// Opens the target device the way the devices list does. The shared helper
/// owns the profile lookup and the permission gate; the only extra step here
/// is resolving the id the tracking config carries into a device.
Future<void> _openDeviceTarget(WidgetRef ref, String deviceId) async {
  try {
    final device =
        (await getIt<ITbClientService>().client
            .getDeviceControllerApi()
            .getDeviceById(deviceId: deviceId)).data;
    if (device == null) {
      return;
    }
    await openDeviceProfileDashboard(
      ref,
      deviceId: device.id,
      deviceType: device.type ?? '',
      deviceName: device.name,
      deviceLabel: device.label,
    );
  } catch (e, s) {
    getIt<TbLogger>().error('LiveTrackingPage: failed to open device', e, s);
  }
}

/// Tiles describing where fixes are saved: target entity (a link when its
/// type has a details page) and the dashboard the session was started from
/// (a link when its id is known).
List<Widget> _saveConfigTiles(
  BuildContext context,
  WidgetRef ref,
  LiveTrackingConfig config,
  String targetName,
) {
  final onTargetTap = _targetTapHandler(context, ref, config.target);
  final dashboard = config.dashboard;
  final dashboardId = dashboard?.id;
  return [
    ListTile(
      title: Text(S.of(context).liveTrackingTarget),
      subtitle: Text(
        targetName,
        style: onTargetTap != null ? _linkStyle(context) : null,
      ),
      onTap: onTargetTap,
    ),
    if (dashboard != null)
      ListTile(
        title: Text(S.of(context).liveTrackingDashboard),
        subtitle: Text(
          dashboard.title ?? dashboardId ?? '',
          style: dashboardId != null ? _linkStyle(context) : null,
        ),
        onTap:
            dashboardId != null
                ? () =>
                    context.push('${DashboardRoutes.dashboard}/$dashboardId')
                : null,
      ),
  ];
}

class _ActiveSession extends ConsumerWidget {
  const _ActiveSession({required this.session});

  final LiveTrackingSession session;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tracking = session.status == LiveTrackingStatus.tracking;
    final lastFix = session.lastFix;
    final target = session.config.target;
    final nameAsync = ref.watch(
      targetNameProvider(entityType: target.entityType, id: target.id),
    );
    final name = displayTargetName(
      nameAsync.value ?? session.config.targetName,
      target,
    );
    final statusColor =
        tracking
            ? AppColors.notificationSuccess
            : AppColors.notificationWarning;
    return ListView(
      children: [
        ..._saveConfigTiles(context, ref, session.config, name),
        ListTile(
          title: Text(S.of(context).liveTrackingStatus),
          subtitle: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                tracking ? Icons.play_arrow : Icons.pause,
                size: 18,
                color: statusColor,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  tracking
                      ? S.of(context).liveTrackingActive
                      : S.of(context).liveTrackingPaused,
                  style: TextStyle(color: statusColor),
                ),
              ),
            ],
          ),
        ),
        ListTile(
          title: Text(S.of(context).liveTrackingStarted),
          subtitle: Text(_formatSessionTime(session.startedAt)),
        ),
        ListTile(
          title: Text(
            '${S.of(context).liveTrackingFixes}: ${session.fixCount} · '
            '${S.of(context).liveTrackingSaved}: ${session.savedCount} · '
            '${S.of(context).liveTrackingErrors}: ${session.saveErrorCount}',
          ),
        ),
        if (lastFix != null)
          ListTile(
            title: Text(S.of(context).liveTrackingLastFix),
            subtitle: Text(
              '${lastFix.latitude.toStringAsFixed(6)}, '
              '${lastFix.longitude.toStringAsFixed(6)} '
              '(±${lastFix.accuracy.toStringAsFixed(0)} m)',
            ),
          ),
        if (session.lastError != null)
          ListTile(
            title: Text(S.of(context).liveTrackingLastError),
            subtitle: Text(
              _errorLabel(context, session.lastError!),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    final notifier = ref.read(liveTrackingProvider.notifier);
                    tracking ? notifier.pause() : notifier.resume();
                  },
                  icon: Icon(tracking ? Icons.pause : Icons.play_arrow),
                  label: Text(
                    tracking
                        ? S.of(context).liveTrackingPause
                        : S.of(context).liveTrackingResume,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton.icon(
                  onPressed:
                      () => ref.read(liveTrackingProvider.notifier).stop(),
                  icon: const Icon(Icons.stop),
                  label: Text(S.of(context).liveTrackingStop),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _IdleView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordAsync = ref.watch(lastRecordProvider);
    return recordAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, _) => Center(child: Text(S.of(context).liveTrackingNoRecord)),
      data: (record) {
        if (record == null) {
          return Center(child: Text(S.of(context).liveTrackingNoRecord));
        }
        return _LastSession(record: record);
      },
    );
  }
}

class _LastSession extends ConsumerWidget {
  const _LastSession({required this.record});

  final LastTrackingRecord record;

  String _endReasonLabel(BuildContext context) => switch (record.endReason) {
    TrackingEndReason.manual => S.of(context).liveTrackingEndReasonManual,
    TrackingEndReason.maxDuration =>
      S.of(context).liveTrackingEndReasonMaxDuration,
    TrackingEndReason.interrupted =>
      S.of(context).liveTrackingEndReasonInterrupted,
  };

  Future<void> _startAgain(WidgetRef ref) async {
    // AuthUser.sub is the current user's email (phase-1c trackedBy semantics);
    // re-derive it so a relaunch is attributed to whoever is logged in now.
    final email = getIt<ITbClientService>().client.getAuthUser()?.sub;
    final config = LiveTrackingConfig.fromJson({
      ...record.configJson,
      if (email != null) 'trackedBy': email,
    });
    await ref.read(liveTrackingProvider.notifier).startConfig(config);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = record.config;
    final name = displayTargetName(
      record.targetName ?? config.targetName,
      config.target,
    );
    return ListView(
      children: [
        ListTile(
          title: Text(
            S.of(context).liveTrackingLastSession,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        ..._saveConfigTiles(context, ref, config, name),
        ListTile(
          title: Text(S.of(context).liveTrackingStarted),
          subtitle: Text(_formatSessionTime(record.startedAt)),
        ),
        if (record.endedAt != null)
          ListTile(
            title: Text(S.of(context).liveTrackingEnded),
            subtitle: Text(_formatSessionTime(record.endedAt!)),
          ),
        ListTile(
          title: Text(S.of(context).liveTrackingEndReason),
          subtitle: Text(_endReasonLabel(context)),
        ),
        ListTile(
          title: Text(
            '${S.of(context).liveTrackingFixes}: ${record.fixCount} · '
            '${S.of(context).liveTrackingSaved}: ${record.savedCount} · '
            '${S.of(context).liveTrackingErrors}: ${record.saveErrorCount}',
          ),
        ),
        if (record.lastLat != null && record.lastLng != null)
          ListTile(
            title: Text(S.of(context).liveTrackingLastFix),
            subtitle: Text(
              '${record.lastLat!.toStringAsFixed(6)}, '
              '${record.lastLng!.toStringAsFixed(6)}',
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton.icon(
            onPressed: () => _startAgain(ref),
            icon: const Icon(Icons.play_arrow),
            label: Text(S.of(context).liveTrackingStartAgain),
          ),
        ),
      ],
    );
  }
}
