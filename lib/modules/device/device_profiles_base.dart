import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/device_profile/device_profile_cache.dart';
import 'package:thingsboard_app/utils/services/device_profile/model/cached_device_profile.dart';
import 'package:thingsboard_app/utils/services/entity_query_api.dart';
import 'package:thingsboard_app/utils/utils.dart';

mixin DeviceProfilesBase on EntitiesBase<DeviceProfileInfo, PageLink> {
  final RefreshDeviceCounts refreshDeviceCounts = RefreshDeviceCounts();

  @override
  String get title => 'Devices';

  @override
  String get noItemsFoundText => 'No devices found';

  @override
  Future<PageData<DeviceProfileInfo>> fetchEntities(PageLink pageLink, {bool refresh = false}) {
    return DeviceProfileCache.getDeviceProfileInfos(tbClient, pageLink, invalidateCache: refresh);
  }

  @override
  void onEntityTap(DeviceProfileInfo deviceProfile) {
    getIt<ThingsboardAppRouter>().navigateTo(
      '/deviceList?deviceType=${Uri.encodeComponent(deviceProfile.name)}',
    );
  }

  @override
  Future<void> onRefresh() {
    if (refreshDeviceCounts.onRefresh != null) {
      return refreshDeviceCounts.onRefresh!();
    } else {
      return Future.value();
    }
  }

  @override
  Widget? buildHeading(BuildContext context) {
    return AllDevicesCard(tbContext, refreshDeviceCounts);
  }

  @override
  Widget buildEntityGridCard(
    BuildContext context,
    DeviceProfileInfo deviceProfile,
  ) {
    return DeviceProfileCard(tbContext, deviceProfile);
  }

  @override
  double? gridChildAspectRatio() {
    return 156 / 200;
  }
}

class RefreshDeviceCounts {
  Future<void> Function()? onRefresh;
}

class AllDevicesCard extends TbContextWidget {
  AllDevicesCard(super.tbContext, this.refreshDeviceCounts, {super.key});
  final RefreshDeviceCounts refreshDeviceCounts;

  @override
  State<StatefulWidget> createState() => _AllDevicesCardState();
}

class _AllDevicesCardState extends TbContextState<AllDevicesCard> {
  final StreamController<int?> _activeDevicesCount =
      StreamController.broadcast();
  final StreamController<int?> _inactiveDevicesCount =
      StreamController.broadcast();

  @override
  void initState() {
    super.initState();
    widget.refreshDeviceCounts.onRefresh = _countDevices;
    _countDevices();
  }

  @override
  void didUpdateWidget(AllDevicesCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.refreshDeviceCounts.onRefresh = _countDevices;
  }

  @override
  void dispose() {
    _activeDevicesCount.close();
    _inactiveDevicesCount.close();
    widget.refreshDeviceCounts.onRefresh = null;
    super.dispose();
  }

  Future<void> _countDevices() {
    _activeDevicesCount.add(null);
    _inactiveDevicesCount.add(null);
    final Future<int> activeDevicesCount = EntityQueryApi.countDevices(
      tbClient,
      active: true,
    );
    final Future<int> inactiveDevicesCount = EntityQueryApi.countDevices(
      tbClient,
      active: false,
    );
    final Future<List<int>> countsFuture = Future.wait([
      activeDevicesCount,
      inactiveDevicesCount,
    ]);
    countsFuture.then((counts) {
      if (mounted) {
        _activeDevicesCount.add(counts[0]);
        _inactiveDevicesCount.add(counts[1]);
      }
    });
    return countsFuture;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((255 * 0.05).ceil()),
              blurRadius: 6.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          elevation: 0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).allDevices,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 20 / 14,
                      ),
                    ),
                    const Icon(Icons.arrow_forward, size: 18),
                  ],
                ),
              ),
              const Divider(height: 1),
              Padding(
                padding: EdgeInsets.zero,
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: StreamBuilder<int?>(
                            stream: _activeDevicesCount.stream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final deviceCount = snapshot.data!;
                                return _buildDeviceCount(
                                  context,
                                  true,
                                  deviceCount,
                                );
                              } else {
                                return Center(
                                  child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation(
                                        Theme.of(
                                          tbContext.currentState!.context,
                                        ).colorScheme.primary,
                                      ),
                                      strokeWidth: 2.5,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        onTap: () {
                          getIt<ThingsboardAppRouter>()
                          // translate-me-ignore-next-line
                          .navigateTo('/deviceList?active=true');
                        },
                      ),
                    ),
                    // SizedBox(width: 4),
                    const SizedBox(
                      width: 1,
                      height: 40,
                      child: VerticalDivider(width: 1),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: StreamBuilder<int?>(
                            stream: _inactiveDevicesCount.stream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final deviceCount = snapshot.data!;
                                return _buildDeviceCount(
                                  context,
                                  false,
                                  deviceCount,
                                );
                              } else {
                                return Center(
                                  child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation(
                                        Theme.of(
                                          tbContext.currentState!.context,
                                        ).colorScheme.primary,
                                      ),
                                      strokeWidth: 2.5,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        onTap: () {
                          getIt<ThingsboardAppRouter>()
                          // translate-me-ignore-next-line
                          .navigateTo('/deviceList?active=false');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        getIt<ThingsboardAppRouter>().navigateTo('/deviceList');
      },
    );
  }
}

class DeviceProfileCard extends TbContextWidget {
  DeviceProfileCard(super.tbContext, this.deviceProfile, {super.key});
  final DeviceProfileInfo deviceProfile;

  @override
  State<StatefulWidget> createState() => _DeviceProfileCardState();
}

class _DeviceProfileCardState extends TbContextState<DeviceProfileCard> {
  late Future<CachedDeviceProfileInfo> countedProfile;

  @override
  void initState() {
    super.initState();
    _countDevices();
  }

  @override
  void didUpdateWidget(DeviceProfileCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    _countDevices();
  }

  void _countDevices() {
    countedProfile = DeviceProfileCache.getDevicesCount(
      tbClient,
      widget.deviceProfile.name,
    );
  }

  @override
  Widget build(BuildContext context) {
    final entity = widget.deviceProfile;
    final hasImage = entity.image != null;
    Widget image;
    if (hasImage) {
      image = Utils.imageFromTbImage(
        context,
        tbClient,
        entity.image,
        width: 64,
        height: 64,
      );
    } else {
      image = SvgPicture.asset(
        width: 64,
        height: 64,
        ThingsboardImage.deviceProfilePlaceholder,
        semanticsLabel: 'Device profile',
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Column(
        children: [
          Expanded(
            child: Padding(padding: const EdgeInsets.all(16), child: image),
          ),
          SizedBox(
            height: 44,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Center(
                child: AutoSizeText(
                  entity.name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 20 / 14,
                  ),
                ),
              ),
            ),
          ),
          const Divider(height: 1),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: FutureBuilder<CachedDeviceProfileInfo>(
              future: countedProfile,
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  final deviceCount = snapshot.data!;
                  return _buildDeviceCount(context, true, deviceCount.activeCount!);
                } else {
                  return SizedBox(
                    height: 40,
                    child: Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                            Theme.of(
                              tbContext.currentState!.context,
                            ).colorScheme.primary,
                          ),
                          strokeWidth: 2.5,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
            onTap: () {
              getIt<ThingsboardAppRouter>().navigateTo(
                // translate-me-ignore-next-line
                '/deviceList?active=true&deviceType=${Uri.encodeComponent(entity.name)}',
              );
            },
          ),
          const Divider(height: 1),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: FutureBuilder<CachedDeviceProfileInfo>(
              future: countedProfile,
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  final deviceCount = snapshot.data!;
                  return _buildDeviceCount(context, false, deviceCount.inactiveCount!);
                } else {
                  return SizedBox(
                    height: 40,
                    child: Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                            Theme.of(
                              tbContext.currentState!.context,
                            ).colorScheme.primary,
                          ),
                          strokeWidth: 2.5,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
            onTap: () {
              getIt<ThingsboardAppRouter>().navigateTo(
                // translate-me-ignore-next-line
                '/deviceList?active=false&deviceType=${Uri.encodeComponent(entity.name)}',
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildDeviceCount(BuildContext context, bool active, int count) {
  final Color color =
      active ? const Color(0xFF008A00) : const Color(0xFFAFAFAF);
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Stack(
              children: [
                Icon(Icons.devices_other, size: 16, color: color),
                if (!active)
                  CustomPaint(
                    size: const Size.square(16),
                    painter: StrikeThroughPainter(color: color, offset: 2),
                  ),
              ],
            ),
            const SizedBox(width: 8.67),
            Text(
              active ? S.of(context).active : S.of(context).inactive,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 16 / 12,
                color: color,
              ),
            ),
            const SizedBox(width: 8.67),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 16 / 12,
                color: color,
              ),
            ),
          ],
        ),
        const Icon(Icons.chevron_right, size: 16, color: Color(0xFFACACAC)),
      ],
    ),
  );
}

class StrikeThroughPainter extends CustomPainter {
  StrikeThroughPainter({required this.color, this.offset = 0});
  final Color color;
  final double offset;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    paint.strokeWidth = 1.5;
    canvas.drawLine(
      Offset(offset, offset),
      Offset(size.width - offset, size.height - offset),
      paint,
    );
    paint.color = Colors.white;
    canvas.drawLine(
      const Offset(2, 0),
      Offset(size.width + 2, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant StrikeThroughPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
