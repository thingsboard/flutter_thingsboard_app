import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_app/constants/assets_path.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/utils/services/device_profile_cache.dart';
import 'package:thingsboard_app/utils/services/entity_query_api.dart';
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

mixin DeviceProfilesBase on EntitiesBase<DeviceProfileInfo, PageLink> {
  final RefreshDeviceCounts refreshDeviceCounts = RefreshDeviceCounts();

  @override
  String get title => 'Devices';

  @override
  String get noItemsFoundText => 'No devices found';

  @override
  Future<PageData<DeviceProfileInfo>> fetchEntities(PageLink pageLink) {
    return DeviceProfileCache.getDeviceProfileInfos(tbClient, pageLink);
  }

  @override
  void onEntityTap(DeviceProfileInfo deviceProfile) {
    navigateTo('/deviceList?deviceType=${deviceProfile.name}');
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
      BuildContext context, DeviceProfileInfo deviceProfile) {
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
  final RefreshDeviceCounts refreshDeviceCounts;

  AllDevicesCard(TbContext tbContext, this.refreshDeviceCounts)
      : super(tbContext);

  @override
  _AllDevicesCardState createState() => _AllDevicesCardState();
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
    Future<int> activeDevicesCount =
        EntityQueryApi.countDevices(tbClient, active: true);
    Future<int> inactiveDevicesCount =
        EntityQueryApi.countDevices(tbClient, active: false);
    Future<List<int>> countsFuture =
        Future.wait([activeDevicesCount, inactiveDevicesCount]);
    countsFuture.then((counts) {
      if (this.mounted) {
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
          child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              elevation: 0,
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(16, 12, 16, 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${S.of(context).allDevices}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 20 / 14)),
                          Icon(Icons.arrow_forward, size: 18)
                        ],
                      )),
                  Divider(height: 1),
                  Padding(
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
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
                                          var deviceCount = snapshot.data!;
                                          return _buildDeviceCount(
                                              context, true, deviceCount);
                                        } else {
                                          return Center(
                                              child: Container(
                                                  height: 20,
                                                  width: 20,
                                                  child: CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation(
                                                              Theme.of(tbContext
                                                                      .currentState!
                                                                      .context)
                                                                  .colorScheme
                                                                  .primary),
                                                      strokeWidth: 2.5)));
                                        }
                                      },
                                    )),
                                onTap: () {
                                  navigateTo('/deviceList?active=true');
                                }),
                          ),
                          // SizedBox(width: 4),
                          Container(
                              width: 1,
                              height: 40,
                              child: VerticalDivider(width: 1)),
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
                                          var deviceCount = snapshot.data!;
                                          return _buildDeviceCount(
                                              context, false, deviceCount);
                                        } else {
                                          return Center(
                                              child: Container(
                                                  height: 20,
                                                  width: 20,
                                                  child: CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation(
                                                              Theme.of(tbContext
                                                                      .currentState!
                                                                      .context)
                                                                  .colorScheme
                                                                  .primary),
                                                      strokeWidth: 2.5)));
                                        }
                                      },
                                    )),
                                onTap: () {
                                  navigateTo('/deviceList?active=false');
                                }),
                          )
                        ],
                      ))
                ],
              )),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withAlpha((255 * 0.05).ceil()),
                  blurRadius: 6.0,
                  offset: Offset(0, 4))
            ],
          ),
        ),
        onTap: () {
          navigateTo('/deviceList');
        });
  }
}

class DeviceProfileCard extends TbContextWidget {
  final DeviceProfileInfo deviceProfile;

  DeviceProfileCard(TbContext tbContext, this.deviceProfile) : super(tbContext);

  @override
  _DeviceProfileCardState createState() => _DeviceProfileCardState();
}

class _DeviceProfileCardState extends TbContextState<DeviceProfileCard> {
  late Future<int> activeDevicesCount;
  late Future<int> inactiveDevicesCount;

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

  _countDevices() {
    activeDevicesCount = EntityQueryApi.countDevices(tbClient,
        deviceType: widget.deviceProfile.name, active: true);
    inactiveDevicesCount = EntityQueryApi.countDevices(tbClient,
        deviceType: widget.deviceProfile.name, active: false);
  }

  @override
  Widget build(BuildContext context) {
    var entity = widget.deviceProfile;
    var hasImage = entity.image != null;
    Widget image;
    BoxFit imageFit;
    double padding;
    if (hasImage) {
      image = Utils.imageFromBase64(entity.image!);
      imageFit = BoxFit.contain;
      padding = 8;
    } else {
      image = SvgPicture.asset(ThingsboardImage.deviceProfilePlaceholder,
          color: Theme.of(context).primaryColor,
          colorBlendMode: BlendMode.overlay,
          semanticsLabel: 'Device profile');
      imageFit = BoxFit.cover;
      padding = 0;
    }
    return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Column(children: [
          Expanded(
              child: Stack(children: [
            SizedBox.expand(
                child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: FittedBox(
                        clipBehavior: Clip.hardEdge,
                        fit: imageFit,
                        child: image)))
          ])),
          Container(
              height: 44,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Center(
                      child: AutoSizeText(
                    entity.name,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    minFontSize: 12,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 20 / 14),
                  )))),
          Divider(height: 1),
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: FutureBuilder<int>(
                future: activeDevicesCount,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    var deviceCount = snapshot.data!;
                    return _buildDeviceCount(context, true, deviceCount);
                  } else {
                    return Container(
                        height: 40,
                        child: Center(
                            child: Container(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(Theme.of(
                                            tbContext.currentState!.context)
                                        .colorScheme
                                        .primary),
                                    strokeWidth: 2.5))));
                  }
                },
              ),
              onTap: () {
                navigateTo('/deviceList?active=true&deviceType=${entity.name}');
              }),
          Divider(height: 1),
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: FutureBuilder<int>(
                future: inactiveDevicesCount,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    var deviceCount = snapshot.data!;
                    return _buildDeviceCount(context, false, deviceCount);
                  } else {
                    return Container(
                        height: 40,
                        child: Center(
                            child: Container(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(Theme.of(
                                            tbContext.currentState!.context)
                                        .colorScheme
                                        .primary),
                                    strokeWidth: 2.5))));
                  }
                },
              ),
              onTap: () {
                navigateTo(
                    '/deviceList?active=false&deviceType=${entity.name}');
              })
        ]));
  }
}

Widget _buildDeviceCount(BuildContext context, bool active, int count) {
  Color color = active ? Color(0xFF008A00) : Color(0xFFAFAFAF);
  return Padding(
    padding: EdgeInsets.all(12),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Stack(
              children: [
                Icon(Icons.devices_other, size: 16, color: color),
                if (!active)
                  CustomPaint(
                    size: Size.square(16),
                    painter: StrikeThroughPainter(color: color, offset: 2),
                  )
              ],
            ),
            SizedBox(width: 8.67),
            Text(
                active
                    ? '${S.of(context).active}'
                    : '${S.of(context).inactive}',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    height: 16 / 12,
                    color: color)),
            SizedBox(width: 8.67),
            Text(count.toString(),
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    height: 16 / 12,
                    color: color))
          ],
        ),
        Icon(Icons.chevron_right, size: 16, color: Color(0xFFACACAC))
      ],
    ),
  );
}

class StrikeThroughPainter extends CustomPainter {
  final Color color;
  final double offset;

  StrikeThroughPainter({required this.color, this.offset = 0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    paint.strokeWidth = 1.5;
    canvas.drawLine(Offset(offset, offset),
        Offset(size.width - offset, size.height - offset), paint);
    paint.color = Colors.white;
    canvas.drawLine(Offset(2, 0), Offset(size.width + 2, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant StrikeThroughPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
