// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/design_tokens.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/core/entity/contact_info.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/custom_translation/i_custom_translation_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/services/page_data_paging_controller.dart';
import 'package:thingsboard_app/utils/ui/content_direction.dart';
import 'package:thingsboard_app/utils/ui/pagination_widgets/first_page_exception_widget.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

typedef EntityTapFunction<T> = Function(T entity);
typedef EntityCardWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T entity,
);

class EntityCardSettings {
  EntityCardSettings({this.dropShadow = true});
  bool dropShadow;
}

mixin EntitiesBase<T, P> {
  final entityDateFormat = DateFormat('yyyy-MM-dd');
  final ICustomTranslationService customTranslationService = getIt();

  String title(BuildContext context);

  String noItemsFoundText(BuildContext context);

  Future<PageData<T>> fetchEntities(P pageKey, {bool refresh = false});

  Future<void> onRefresh() => Future.value();

  Widget? buildHeading(BuildContext context) => null;

  Key? getKey(T entity) => null;

  Widget buildEntityListCard(BuildContext context, T entity) {
    return Text(S.of(context).notImplemented);
  }

  Widget buildEntityListWidgetCard(BuildContext context, T entity) {
    return Text(S.of(context).notImplemented);
  }

  Widget buildEntityGridCard(BuildContext context, T entity) {
    return Text(S.of(context).notImplemented);
  }

  double? gridChildAspectRatio() => null;

  EntityCardSettings entityListCardSettings(T entity) => EntityCardSettings();

  EntityCardSettings entityGridCardSettings(T entity) => EntityCardSettings();

  void onEntityTap(T entity, WidgetRef ref);
}

mixin ContactBasedBase<T, P> on EntitiesBase<T, P> {
  @override
  Widget buildEntityListCard(BuildContext context, T contact) {
    final info = ContactInfo.of(contact);
    final title = customTranslationService.translate(info?.title);
    final email = info?.email;
    final address = info?.shortAddress;
    return Container(
      constraints: const BoxConstraints(minHeight: 56),
      decoration: BoxDecoration(borderRadius: DesignTokens.borderRadiusSmall),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        spacing: 12,
        children: [
          const Icon(Icons.group, color: AppColors.iconDisabled),
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        textDirection: contentDirection(context, title),
                        textAlign: layoutStart(context),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TbTextStyles.labelLarge.copyWith(
                          color: Colors.black.withValues(alpha: .87),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      entityDateFormat.format(
                        DateTime.fromMillisecondsSinceEpoch(
                          info?.createdTime ?? 0,
                        ),
                      ),
                      style: TbTextStyles.bodyMedium.copyWith(
                        color: Colors.black.withValues(alpha: .54),
                      ),
                    ),
                  ],
                ),

                if (email != null)
                  Text(
                    email,
                    style: TbTextStyles.labelSmall.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                if (address != null)
                  Text(
                    address,
                    style: TbTextStyles.labelSmall.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

abstract class PageKeyController<P> extends ValueNotifier<PageKeyValue<P>> {
  PageKeyController(P initialPageKey) : super(PageKeyValue(initialPageKey));

  P nextPageKey(P pageKey);
}

class PageKeyValue<P> {
  PageKeyValue(this.pageKey);
  final P pageKey;
}

class PageLinkController extends PageKeyController<PageLink> {
  PageLinkController({int pageSize = 20, String? searchText})
    : super(
        PageLink(
          pageSize,
          0,
          searchText,
          SortOrder('createdTime', Direction.DESC),
        ),
      );

  @override
  PageLink nextPageKey(PageLink pageKey) => pageKey.nextPageLink();

  void onSearchText(String searchText) {
    value.pageKey.page = 0;
    value.pageKey.textSearch = searchText;
    notifyListeners();
  }
}

class TimePageLinkController extends PageKeyController<TimePageLink> {
  TimePageLinkController({int pageSize = 20, String? searchText})
    : super(
        TimePageLink(
          pageSize,
          0,
          searchText,
          SortOrder('createdTime', Direction.DESC),
        ),
      );

  @override
  TimePageLink nextPageKey(TimePageLink pageKey) => pageKey.nextPageLink();

  void onSearchText(String searchText) {
    value.pageKey.page = 0;
    value.pageKey.textSearch = searchText;
    notifyListeners();
  }
}

abstract class BaseEntitiesWidget<T, P> extends ConsumerStatefulWidget
    with EntitiesBase<T, P> {
  BaseEntitiesWidget(
    this.pageKeyController, {
    super.key,
    this.searchMode = false,
  });
  final bool searchMode;
  final PageKeyController<P> pageKeyController;

  @override
  Widget? buildHeading(BuildContext context) => searchMode
      ? Text(
          S.of(context).searchResults,
          style: const TextStyle(
            color: Color(0xFFAFAFAF),
            fontSize: 16,
            height: 24 / 16,
          ),
        )
      : null;
}

abstract class BaseEntitiesState<T, P>
    extends ConsumerState<BaseEntitiesWidget<T, P>> {
  BaseEntitiesState();
  late final PageDataPagingController<P, T> pagingController;
  final IOverlayService overlayService = getIt();

  @override
  void initState() {
    super.initState();
    pagingController = PageDataPagingController.withKeys(
      pageKeys: () => widget.pageKeyController,
      fetchPageData: (pageKey, {required refresh}) {
        overlayService.hideNotification();
        return widget.fetchEntities(pageKey, refresh: refresh);
      },
    );
    widget.pageKeyController.addListener(_didChangePageKeyValue);
  }

  @override
  void didUpdateWidget(BaseEntitiesWidget<T, P> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pageKeyController != oldWidget.pageKeyController) {
      oldWidget.pageKeyController.removeListener(_didChangePageKeyValue);
      widget.pageKeyController.addListener(_didChangePageKeyValue);
    }
  }

  @override
  void dispose() {
    widget.pageKeyController.removeListener(_didChangePageKeyValue);
    pagingController.dispose();
    super.dispose();
  }

  /// New search text or filters: start the list over.
  void _didChangePageKeyValue() => pagingController.refresh();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _reload,
      child: pagedViewBuilder(context),
    );
  }

  /// Pull to refresh and "Try again": the heading (counts) and the first page.
  Future<void> _reload() => Future.wait([
    widget.onRefresh(),
    pagingController.reloadFirstPage(refresh: true),
  ]);

  Widget pagedViewBuilder(BuildContext context);

  Widget firstPageProgressIndicatorBuilder(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          top: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [RefreshProgressIndicator()],
          ),
        ),
      ],
    );
  }

  Widget newPageProgressIndicatorBuilder(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      child: Center(child: RefreshProgressIndicator()),
    );
  }

  /// The client already reported why the first page failed.
  Widget firstPageErrorIndicatorBuilder(BuildContext context) {
    return FirstPageExceptionIndicator(
      title: S.of(context).somethingWentWrong,
      onTryAgain: _reload,
    );
  }

  Widget newPageErrorIndicatorBuilder(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: pagingController.fetchNextPage,
        icon: const Icon(Icons.refresh),
        label: Text(S.of(context).tryAgain),
      ),
    );
  }

  Widget noItemsFoundIndicatorBuilder(BuildContext context) {
    return FirstPageExceptionIndicator(
      title: widget.noItemsFoundText(context),
      message: S.of(context).listIsEmptyText,
      onTryAgain: widget.searchMode ? null : () => pagingController.refresh(),
    );
  }
}
