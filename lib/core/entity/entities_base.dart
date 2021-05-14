import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

typedef EntityTapFunction<T> = Function(T entity);
typedef EntityCardWidgetBuilder<T> = Widget Function(BuildContext context, T entity);

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

  Widget buildEntityListCard(BuildContext context, T entity) {
    return Text('Not implemented!');
  }

  Widget buildEntityListWidgetCard(BuildContext context, T entity) {
    return Text('Not implemented!');
  }

  Widget buildEntityGridCard(BuildContext context, T entity) {
    return Text('Not implemented!');
  }

  P createFirstKey({int pageSize = 10}) => throw UnimplementedError('Not implemented');

  P nextPageKey(P pageKey) => throw UnimplementedError('Not implemented');

  EntityCardSettings entityListCardSettings(T entity) => EntityCardSettings();

  EntityCardSettings entityGridCardSettings(T entity) => EntityCardSettings();

  void onEntityTap(T entity);

}

mixin EntitiesBaseWithPageLink<T> on EntitiesBase<T, PageLink> {

  @override
  PageLink createFirstKey({int pageSize = 10}) => PageLink(pageSize, 0, null, SortOrder('createdTime', Direction.DESC));

  @override
  PageLink nextPageKey(PageLink pageKey) => pageKey.nextPageLink();

}

mixin EntitiesBaseWithTimePageLink<T> on EntitiesBase<T, TimePageLink> {

  @override
  TimePageLink createFirstKey({int pageSize = 10}) => TimePageLink(pageSize, 0, null, SortOrder('createdTime', Direction.DESC));

  @override
  TimePageLink nextPageKey(TimePageLink pageKey) => pageKey.nextPageLink();

}

abstract class BaseEntitiesPageLinkWidget<T> extends BaseEntitiesWidget<T, PageLink> with EntitiesBaseWithPageLink<T> {
  BaseEntitiesPageLinkWidget(TbContext tbContext): super(tbContext);
}

abstract class BaseEntitiesTimePageLinkWidget<T> extends BaseEntitiesWidget<T, TimePageLink> with EntitiesBaseWithTimePageLink<T> {
  BaseEntitiesTimePageLinkWidget(TbContext tbContext): super(tbContext);
}

abstract class BaseEntitiesWidget<T, P> extends TbContextWidget<BaseEntitiesWidget<T, P>, BaseEntitiesState<T, P>> with EntitiesBase<T, P> {

  BaseEntitiesWidget(TbContext tbContext): super(tbContext);

}

abstract class BaseEntitiesState<T, P> extends TbContextState<BaseEntitiesWidget<T, P>, BaseEntitiesState<T, P>> {

  late final PagingController<P, T> pagingController;
  Completer<void>? _refreshCompleter;

  @override
  void initState() {
    super.initState();
    pagingController = PagingController(firstPageKey: widget.createFirstKey());
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  bool _dataLoading = false;
  bool _scheduleRefresh = false;

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
    _fetchPage(widget.createFirstKey(), refresh: true);
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
          final nextPageKey = widget.nextPageKey(pageKey);
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
        onRefresh: () => Future.wait([
          widget.onRefresh(),
          _refresh()
        ]),
        child: pagedViewBuilder(context)
    );
  }
  
  Widget pagedViewBuilder(BuildContext context);

  Widget firstPageProgressIndicatorBuilder(BuildContext context) {
    return Stack( children: [
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
      message: 'The list is currently empty.',
      onTryAgain: () => pagingController.refresh(),
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
                  label: const Text(
                    'Try Again',
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
