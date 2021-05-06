import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

abstract class EntitiesPage<T extends BaseData> extends TbContextWidget<EntitiesPage<T>, _EntitiesPageState<T>> with EntitiesBase<T> {

  EntitiesPage(TbContext tbContext): super(tbContext);

  String get searchHint;

  String get noMoreItemsText;

  @override
  _EntitiesPageState createState() => _EntitiesPageState();

}

class _EntitiesPageState<T extends BaseData> extends TbContextState<EntitiesPage<T>, _EntitiesPageState<T>> {

  final _searchModeNotifier = ValueNotifier<bool>(false);

  final PagingController<PageLink, T> _pagingController = PagingController(firstPageKey: PageLink(10, 0, null, SortOrder('createdTime', Direction.DESC)));

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  bool _dataLoading = false;
  bool _scheduleRefresh = false;

  void _refresh() {
    if (_dataLoading) {
      _scheduleRefresh = true;
    } else {
      _pagingController.refresh();
    }
  }

  Future<void> _fetchPage(PageLink pageKey) async {
    if (mounted) {
      _dataLoading = true;
      try {
        hideNotification();
        final pageData = await widget.fetchEntities(pageKey);
        final isLastPage = !pageData.hasNext;
        if (isLastPage) {
          _pagingController.appendLastPage(pageData.data);
        } else {
          final nextPageKey = pageKey.nextPageLink();
          _pagingController.appendPage(pageData.data, nextPageKey);
        }
      } catch (error) {
        if (mounted) {
          _pagingController.error = error;
        }
      } finally {
        _dataLoading = false;
        if (_scheduleRefresh) {
          _scheduleRefresh = false;
          if (mounted) {
            _pagingController.refresh();
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TbAppBar(
          tbContext,
          title: Text(widget.title),
          searchModeNotifier: _searchModeNotifier,
          searchHint: widget.searchHint,
          onSearch: (String searchText) {
            _pagingController.firstPageKey.textSearch = searchText;
            _pagingController.firstPageKey.page = 0;
            _refresh();
          },
        ),
        body: RefreshIndicator(
          onRefresh: () => Future.sync(
                () => _refresh(),
          ),
          child: PagedListView(
              pagingController: _pagingController,
              padding: EdgeInsets.all(0),
              builderDelegate: PagedChildBuilderDelegate<T>(
                  itemBuilder: (context, item, index) => EntityCard<T>(
                      item,
                      entityCardWidgetBuilder: widget.buildEntityCard,
                      onDetails: widget.onEntityDetails,
                      briefView: false
                  ),
                  firstPageProgressIndicatorBuilder: (context) {
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
                  },
                  newPageProgressIndicatorBuilder: (context) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                      ),
                      child: Center(child: RefreshProgressIndicator()),
                    );
                  },
                  noItemsFoundIndicatorBuilder: (context) => FirstPageExceptionIndicator(
                    title: widget.noItemsFoundText,
                    message: 'The list is currently empty.',
                    onTryAgain: () => _refresh(),
                  )
              )
          )
        )
        /* bottomNavigationBar: BottomAppBar(
            child: Row(
              children: [
                IconButton(icon: Icon(Icons.refresh), onPressed: () {
                  _refresh();
                }),
                Spacer(),
                IconButton(icon: Icon(Icons.search), onPressed: () {
                  _searchModeNotifier.value = true;
                })
              ]
            )
        ) */
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
