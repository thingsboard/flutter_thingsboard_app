import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
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
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/utils.dart';

mixin DevicesBase on EntitiesBase<EntityData, EntityDataQuery> {
  final IOverlayService overlayService = getIt();
  @override
  String get title => 'Devices';

  @override
  String get noItemsFoundText => 'No devices found';

  @override
  Future<PageData<EntityData>> fetchEntities(EntityDataQuery dataQuery, {bool refresh = false}) {
    return tbClient.getEntityQueryService().findEntityDataByQuery(dataQuery);
  }

  @override
  Future<void> onEntityTap(EntityData device) async {
    final profile = await DeviceProfileCache.getDeviceProfileInfo(
      tbClient,
      device.field('type')!,
      device.entityId.id!,
    );
    if (profile.info.defaultDashboardId != null) {
      final dashboardId = profile.info.defaultDashboardId!.id!;
      final state = Utils.createDashboardEntityState(
        device.entityId,
        entityName: device.field('name'),
        entityLabel: device.field('label'),
      );
      getIt<ThingsboardAppRouter>().navigateToDashboard(
        dashboardId,
        dashboardTitle: device.field('name'),
        state: state,
      );
    } else {
      if (tbClient.isTenantAdmin()) {
        overlayService.showWarnNotification( (context) => 
          S.of(context).mobileDashboardShouldBeConfiguredInDeviceProfile,
        );
      }
    }
  }

  @override
  Widget buildEntityListCard(BuildContext context, EntityData device) {
    return _buildEntityListCard(context, device, false);
  }

  @override
  Widget buildEntityListWidgetCard(BuildContext context, EntityData device) {
    return _buildEntityListCard(context, device, true);
  }

  @override
  Widget buildEntityGridCard(BuildContext context, EntityData device) {
    return Text(device.field('name')!);
  }

  bool displayCardImage(bool listWidgetCard) => listWidgetCard;

  Widget _buildEntityListCard(
    BuildContext context,
    EntityData device,
    bool listWidgetCard,
  ) {
    return DeviceCard(
      tbContext,
      device: device,
      listWidgetCard: listWidgetCard,
      displayImage: displayCardImage(listWidgetCard),
    );
  }
}

class DeviceQueryController extends PageKeyController<EntityDataQuery> {
  DeviceQueryController({
    int pageSize = 20,
    String? searchText,
    String? deviceType,
    bool? active,
  }) : super(
          EntityQueryApi.createDefaultDeviceQuery(
            pageSize: pageSize,
            searchText: searchText,
            deviceType: deviceType,
            active: active,
          ),
        );

  @override
  EntityDataQuery nextPageKey(EntityDataQuery pageKey) => pageKey.next();

  void onSearchText(String searchText) {
    value.pageKey.pageLink.page = 0;
    value.pageKey.pageLink.textSearch = searchText;
    notifyListeners();
  }
}

class DeviceCard extends TbContextWidget {
  DeviceCard(
    super.tbContext, {
    super.key,
    required this.device,
    this.listWidgetCard = false,
    this.displayImage = false,
  });
  final EntityData device;
  final bool listWidgetCard;
  final bool displayImage;

  @override
  State<StatefulWidget> createState() => _DeviceCardState();
}

class _DeviceCardState extends TbContextState<DeviceCard> {
  final entityDateFormat = DateFormat('yyyy-MM-dd');

  late Future<CachedDeviceProfileInfo> deviceProfileFuture;

  @override
  void initState() {
    super.initState();
    if (widget.displayImage || !widget.listWidgetCard) {
      deviceProfileFuture = DeviceProfileCache.getDeviceProfileInfo(
        tbClient,
        widget.device.field('type')!,
        widget.device.entityId.id!,
      );
    }
  }

  @override
  void didUpdateWidget(DeviceCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.displayImage || !widget.listWidgetCard) {
      final oldDevice = oldWidget.device;
      final device = widget.device;
      if (oldDevice.field('type')! != device.field('type')!) {
        deviceProfileFuture = DeviceProfileCache.getDeviceProfileInfo(
          tbClient,
          widget.device.field('type')!,
          widget.device.entityId.id!,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.listWidgetCard) {
      return buildListWidgetCard(context);
    } else {
      return buildCard(context);
    }
  }

  Widget buildCard(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 4,
              decoration: BoxDecoration(
                color: widget.device.attribute('active') == 'true'
                    ? const Color(0xFF008A00)
                    : const Color(0xFFAFAFAF),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
              ),
            ),
          ),
        ),
        FutureBuilder<CachedDeviceProfileInfo>(
          future: deviceProfileFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              final profile = snapshot.data!;
              final bool hasDashboard = profile.info.defaultDashboardId != null;
              Widget image;
              BoxFit imageFit;
              if (profile.info.image != null) {
                image =
                    Utils.imageFromTbImage(context, tbClient, profile.info.image);
                imageFit = BoxFit.contain;
              } else {
                image = SvgPicture.asset(
                  ThingsboardImage.deviceProfilePlaceholder,
                 
                  semanticsLabel: 'Device',
                );
                imageFit = BoxFit.contain;
              }
              return Row(
                children: [
                  const SizedBox(width: 20),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            if (widget.displayImage)
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: FittedBox(
                                          fit: imageFit,
                                          child: image,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            const SizedBox(width: 12),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        fit: FlexFit.tight,
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            widget.device.field('name')!,
                                            style: const TextStyle(
                                              color: Color(
                                                0xFF282828,
                                              ),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              height: 20 / 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        entityDateFormat.format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                            widget.device.createdTime!,
                                          ),
                                        ),
                                        style: const TextStyle(
                                          color: Color(0xFFAFAFAF),
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          height: 16 / 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.device.field('type')!,
                                        style: const TextStyle(
                                          color: Color(0xFFAFAFAF),
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          height: 16 / 12,
                                        ),
                                      ),
                                      Text(
                                        widget.device.attribute(
                                                  'active',
                                                ) ==
                                                'true'
                                            ? S.of(context).active
                                            : S.of(context).inactive,
                                        style: TextStyle(
                                          color: widget.device.attribute(
                                                    'active',
                                                  ) ==
                                                  'true'
                                              ? const Color(0xFF008A00)
                                              : const Color(0xFFAFAFAF),
                                          fontSize: 12,
                                          height: 16 / 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            if (hasDashboard)
                              const Icon(
                                Icons.chevron_right,
                                color: Color(0xFFACACAC),
                              ),
                            if (hasDashboard) const SizedBox(width: 16),
                          ],
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox(
                height: 64,
                child: Center(
                  child: RefreshProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(
                      Theme.of(tbContext.currentState!.context)
                          .colorScheme
                          .primary,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }

  Widget buildListWidgetCard(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.displayImage)
          Container(
            width: 58,
            height: 58,
            decoration: const BoxDecoration(
              // color: Color(0xFFEEEEEE),
              borderRadius: BorderRadius.horizontal(left: Radius.circular(4)),
            ),
            child: FutureBuilder<CachedDeviceProfileInfo>(
              future: deviceProfileFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  final profile = snapshot.data!;
                  Widget image;
                  BoxFit imageFit;
                  if (profile.info.image != null) {
                    image = Utils.imageFromTbImage(
                      context,
                      tbClient,
                      profile.info.image,
                    );
                    imageFit = BoxFit.contain;
                  } else {
                    image = SvgPicture.asset(
                      ThingsboardImage.deviceProfilePlaceholder,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).primaryColor,
                        BlendMode.overlay,
                      ),
                      semanticsLabel: 'Device',
                    );
                    imageFit = BoxFit.cover;
                  }
                  return ClipRRect(
                    borderRadius:
                        const BorderRadius.horizontal(left: Radius.circular(4)),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: FittedBox(
                            fit: imageFit,
                            child: image,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: RefreshProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                        Theme.of(tbContext.currentState!.context)
                            .colorScheme
                            .primary,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.device.field('name')!,
                        style: const TextStyle(
                          color: Color(0xFF282828),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 20 / 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.device.field('type')!,
                      style: const TextStyle(
                        color: Color(0xFFAFAFAF),
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        height: 16 / 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
