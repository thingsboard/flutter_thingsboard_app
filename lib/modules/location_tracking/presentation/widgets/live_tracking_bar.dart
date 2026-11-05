// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/location_tracking_routes.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/location_tracking/presentation/provider/live_tracking_provider.dart';
import 'package:thingsboard_app/utils/services/live_location_tracking/model/live_tracking_session.dart';

/// Persistent bar shown on all main pages while a tracking session exists.
class LiveTrackingBar extends ConsumerWidget {
  const LiveTrackingBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewState = ref.watch(liveTrackingProvider);
    final session = viewState.session;
    if (session == null) {
      return const SizedBox.shrink();
    }
    final colors = Theme.of(context).colorScheme;
    final tracking = session.status == LiveTrackingStatus.tracking;

    if (viewState.hidden) {
      return SafeArea(bottom: false, child: _CollapsedBar(tracking: tracking));
    }

    // The bar sits at the top of the shell, so it — not the pages under it —
    // owns the status bar inset. NavigationPage removes that inset from the
    // page subtree while the bar is visible, so it is never applied twice.
    return SafeArea(
      bottom: false,
      child: Material(
        color: colors.primaryContainer,
        child: InkWell(
          onTap: () => _openSessionPage(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              children: [
                Icon(
                  tracking ? Icons.gps_fixed : Icons.gps_off,
                  color: colors.onPrimaryContainer,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tracking
                            ? S.of(context).liveTrackingActive
                            : S.of(context).liveTrackingPaused,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: colors.onPrimaryContainer,
                        ),
                      ),
                      Text(
                        '${S.of(context).liveTrackingFixes}: '
                        '${session.fixCount} · '
                        '${S.of(context).liveTrackingSaved}: '
                        '${session.savedCount}'
                        '${session.saveErrorCount > 0 ? ' · ${S.of(context).liveTrackingErrors}: ${session.saveErrorCount}' : ''}',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: colors.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip:
                      tracking
                          ? S.of(context).liveTrackingPause
                          : S.of(context).liveTrackingResume,
                  icon: Icon(
                    tracking ? Icons.pause : Icons.play_arrow,
                    color: colors.onPrimaryContainer,
                  ),
                  onPressed: () {
                    final notifier = ref.read(liveTrackingProvider.notifier);
                    tracking ? notifier.pause() : notifier.resume();
                  },
                ),
                IconButton(
                  tooltip: S.of(context).liveTrackingStop,
                  icon: Icon(Icons.stop, color: colors.onPrimaryContainer),
                  onPressed:
                      () => ref.read(liveTrackingProvider.notifier).stop(),
                ),
                IconButton(
                  tooltip: S.of(context).liveTrackingHide,
                  icon: Icon(
                    Icons.expand_less,
                    color: colors.onPrimaryContainer,
                  ),
                  onPressed:
                      () => ref.read(liveTrackingProvider.notifier).hide(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// The session page is registered in the same shell as this bar, so the bar
/// stays visible while the page is open and an unguarded push would stack
/// another copy of it on every tap.
void _openSessionPage(BuildContext context) {
  if (GoRouterState.of(context).uri.path ==
      LocationTrackingRoutes.liveTracking) {
    return;
  }
  context.push(LocationTrackingRoutes.liveTracking);
}

class _CollapsedBar extends HookConsumerWidget {
  const _CollapsedBar({required this.tracking});

  final bool tracking;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 900),
    );
    useEffect(() {
      if (tracking) {
        controller.repeat(reverse: true);
      } else {
        controller.stop();
        controller.value = 1;
      }
      return null;
    }, [tracking]);

    return Material(
      color: colors.primaryContainer,
      child: InkWell(
        onTap: () => ref.read(liveTrackingProvider.notifier).show(),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Center(
              child: FadeTransition(
                opacity: Tween<double>(begin: 0.35, end: 1).animate(controller),
                child: Icon(
                  tracking ? Icons.gps_fixed : Icons.gps_off,
                  size: 18,
                  color: colors.onPrimaryContainer,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
