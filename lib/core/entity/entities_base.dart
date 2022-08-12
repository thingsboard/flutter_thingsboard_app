import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/utils/utils.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

const Map<EntityType, String> entityTypeTranslations = {
  EntityType.TENANT: 'Tenant',
  EntityType.TENANT_PROFILE: 'Tenant profile',
  EntityType.CUSTOMER: 'Customer',
  EntityType.USER: 'User',
  EntityType.DASHBOARD: 'Dashboard',
  EntityType.ASSET: 'Asset',
  EntityType.DEVICE: 'Device',
  EntityType.DEVICE_PROFILE: 'Device profile',
  EntityType.ALARM: 'Alarm',
  EntityType.RULE_CHAIN: 'Rule chain',
  EntityType.RULE_NODE: 'Rule node',
  EntityType.EDGE: 'Edge',
  EntityType.ENTITY_VIEW: 'Entity view',
  EntityType.WIDGETS_BUNDLE: 'Widgets bundle',
  EntityType.WIDGET_TYPE: 'Widget type',
  EntityType.API_USAGE_STATE: 'Api Usage State',
  EntityType.TB_RESOURCE: 'Resource',
  EntityType.OTA_PACKAGE: 'OTA package'
};

typedef EntityTapFunction<T> = Function(T entity);
typedef EntityCardWidgetBuilder<T> = Widget Function(
    BuildContext context, T entity);

class EntityCardSettings {
  bool dropShadow;
  EntityCardSettings({this.dropShadow = true});
}

mixin EntitiesBase<T, P> on HasTbContext {
  final entityDateFormat = DateFormat('yyyy-MM-dd');

  String get title;

  String get noItemsFoundText;

  Future<PageData<T>> fetchEntities(P pageKey);

  Future<void> onRefresh() => Future.value();

  Widget? buildHeading(BuildContext context) => null;

  Key? getKey(T entity) => null;

  Widget buildEntityListCard(BuildContext context, T entity) {
    return Text('${S.of(context).notImplemented}');
  }

  Widget buildEntityListWidgetCard(BuildContext context, T entity) {
    return Text('${S.of(context).notImplemented}');
  }

  Widget buildEntityGridCard(BuildContext context, T entity) {
    return Text('${S.of(context).notImplemented}');
  }

  double? gridChildAspectRatio() => null;

  EntityCardSettings entityListCardSettings(T entity) => EntityCardSettings();

  EntityCardSettings entityGridCardSettings(T entity) => EntityCardSettings();

  void onEntityTap(T entity);
}

mixin ContactBasedBase<T extends ContactBased, P> on EntitiesBase<T, P> {
  @override
  Widget buildEntityListCard(BuildContext context, T contact) {
    var address = Utils.contactToShortAddress(contact);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.centerLeft,
                            child: Text('${contact.getName()}',
                                style: TextStyle(
                                    color: Color(0xFF282828),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 20 / 14))),
                        Text(
                            entityDateFormat.format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    contact.createdTime!)),
                            style: TextStyle(
                                color: Color(0xFFAFAFAF),
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                height: 16 / 12))
                      ]),
                  SizedBox(height: 4),
                  if (contact.email != null)
                    Text(contact.email!,
                        style: TextStyle(
                            color: Color(0xFFAFAFAF),
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            height: 16 / 12)),
                  if (contact.email == null) SizedBox(height: 16),
                  if (address != null) SizedBox(height: 4),
                  if (address != null)
                    Text(address,
                        style: TextStyle(
                            color: Color(0xFFAFAFAF),
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            height: 16 / 12)),
                ],
              )),
          SizedBox(width: 16),
          Icon(Icons.chevron_right, color: Color(0xFFACACAC)),
          SizedBox(width: 8)
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
  final P pageKey;

  PageKeyValue(this.pageKey);
}

class PageLinkController extends PageKeyController<PageLink> {
  PageLinkController({int pageSize = 20, String? searchText})
      : super(PageLink(
            pageSize, 0, searchText, SortOrder('createdTime', Direction.DESC)));

  @override
  PageLink nextPageKey(PageLink pageKey) => pageKey.nextPageLink();

  onSearchText(String searchText) {
    value.pageKey.page = 0;
    value.pageKey.textSearch = searchText;
    notifyListeners();
  }
}

class TimePageLinkController extends PageKeyController<TimePageLink> {
  TimePageLinkController({int pageSize = 20, String? searchText})
      : super(TimePageLink(
            pageSize, 0, searchText, SortOrder('createdTime', Direction.DESC)));

  @override
  TimePageLink nextPageKey(TimePageLink pageKey) => pageKey.nextPageLink();

  onSearchText(String searchText) {
    value.pageKey.page = 0;
    value.pageKey.textSearch = searchText;
    notifyListeners();
  }
}

abstract class BaseEntitiesWidget<T, P> extends TbContextWidget
    with EntitiesBase<T, P> {
  final bool searchMode;
  final PageKeyController<P> pageKeyController;

  BaseEntitiesWidget(TbContext tbContext, this.pageKeyController,
      {this.searchMode = false})
      : super(tbContext);

  @override
  Widget? buildHeading(BuildContext context) => searchMode
      ? Text('Search results',
          style: TextStyle(
              color: Color(0xFFAFAFAF), fontSize: 16, height: 24 / 16))
      : null;
}

abstract class BaseEntitiesState<T, P>
    extends TbContextState<BaseEntitiesWidget<T, P>> {
  late final PagingController<P, T> pagingController;
  Completer<void>? _refreshCompleter;
  bool _dataLoading = false;
  bool _scheduleRefresh = false;
  bool _reloadData = false;

  BaseEntitiesState();

  @override
  void initState() {
    super.initState();
    pagingController =
        PagingController(firstPageKey: widget.pageKeyController.value.pageKey);
    widget.pageKeyController.addListener(_didChangePageKeyValue);
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
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

  void _didChangePageKeyValue() {
    _reloadData = true;
    _refresh();
  }

  Future<void> _refresh() {
    if (_refreshCompleter == null) {
      _refreshCompleter = Completer();
    }
    if (_dataLoading) {
      _scheduleRefresh = true;
    } else {
      _refreshPagingController();
    }
    return _refreshCompleter!.future;
  }

  void _refreshPagingController() {
    if (_reloadData) {
      pagingController.refresh();
      _reloadData = false;
    } else {
      _fetchPage(widget.pageKeyController.value.pageKey, refresh: true);
    }
  }

  Future<void> _fetchPage(P pageKey, {bool refresh = false}) async {
    if (mounted) {
      _dataLoading = true;
      try {
        hideNotification();
        final pageData = await widget.fetchEntities(pageKey);
        final isLastPage = !pageData.hasNext;
        if (refresh) {
          var state = pagingController.value;
          if (state.itemList != null) {
            state.itemList!.clear();
          }
        }
        if (isLastPage) {
          pagingController.appendLastPage(pageData.data);
        } else {
          final nextPageKey = widget.pageKeyController.nextPageKey(pageKey);
          pagingController.appendPage(pageData.data, nextPageKey);
        }
      } catch (error) {
        if (mounted) {
          pagingController.error = error;
        }
      } finally {
        _dataLoading = false;
        if (refresh) {
          _refreshCompleter!.complete();
          _refreshCompleter = null;
        }
        if (_scheduleRefresh) {
          _scheduleRefresh = false;
          if (mounted) {
            _refreshPagingController();
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () => Future.wait([widget.onRefresh(), _refresh()]),
        child: pagedViewBuilder(context));
  }

  Widget pagedViewBuilder(BuildContext context);

  Widget firstPageProgressIndicatorBuilder(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: 20,
        left: 0,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [RefreshProgressIndicator()],
        ),
      )
    ]);
  }

  Widget newPageProgressIndicatorBuilder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      child: Center(child: RefreshProgressIndicator()),
    );
  }

  Widget noItemsFoundIndicatorBuilder(BuildContext context) {
    return FirstPageExceptionIndicator(
      title: widget.noItemsFoundText,
      message: '${S.of(context).listIsEmptyText}',
      onTryAgain: widget.searchMode ? null : () => pagingController.refresh(),
    );
  }
}

class FirstPageExceptionIndicator extends StatelessWidget {
  const FirstPageExceptionIndicator({
    required this.title,
    this.message,
    this.onTryAgain,
    Key? key,
  }) : super(key: key);

  final String title;
  final String? message;
  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) {
    final message = this.message;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            if (message != null)
              const SizedBox(
                height: 16,
              ),
            if (message != null)
              Text(
                message,
                textAlign: TextAlign.center,
              ),
            if (onTryAgain != null)
              const SizedBox(
                height: 48,
              ),
            if (onTryAgain != null)
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: onTryAgain,
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  label: Text(
                    '${S.of(context).tryAgain}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
