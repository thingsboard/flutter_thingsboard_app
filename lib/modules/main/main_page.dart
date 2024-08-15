import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/view/single_dashboard_view.dart';
import 'package:thingsboard_app/modules/main/bloc/bottom_bar_bloc.dart';
import 'package:thingsboard_app/modules/main/main_item_widget.dart';
import 'package:thingsboard_app/modules/main/main_navigation_item.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class MainPage extends TbPageWidget {
  MainPage(
    super.tbContext, {
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends TbPageState<MainPage>
    with TbMainState, TickerProviderStateMixin {
  late ValueNotifier<int> _currentIndexNotifier;
  late final List<TbMainNavigationItem> _tabItems;
  late TabController _tabController;
  late final BottomBarBloc bloc;

  @override
  void initState() {
    super.initState();
    _tabItems = TbMainNavigationItem.getItems(tbContext);
    // final currentIndex = _indexFromPath(widget._path);
    // _tabController = TabController(
    //   initialIndex: currentIndex,
    //   length: _tabItems.length,
    //   vsync: this,
    // );

    bloc = BottomBarBloc(router: tbContext.router)
      ..add(BottomBarFetchEvent(context));
    _currentIndexNotifier = ValueNotifier(0);
    // _tabController.animation!.addListener(_onTabAnimation);
  }

  @override
  void dispose() {
    _tabController.animation!.removeListener(_onTabAnimation);
    bloc.close();
    super.dispose();
  }

  _onTabAnimation() {
    var value = _tabController.animation!.value;
    int targetIndex;
    if (value >= _tabController.previousIndex) {
      targetIndex = value.round();
    } else {
      targetIndex = value.floor();
    }
    _currentIndexNotifier.value = targetIndex;
  }

  @override
  Future<bool> willPop() async {
    if (_tabController.index > 0) {
      _setIndex(0);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    TbMainNavigationItem.changeItemsTitleIntl(_tabItems, context);

    return BlocProvider<BottomBarBloc>.value(
      value: bloc,
      child: BlocBuilder<BottomBarBloc, BottomBarState>(
        builder: (context, state) {
          if (state is BottomBarLoadingState) {
            return Scaffold(
              body: TbProgressIndicator(tbContext),
            );
          } else if (state is BottomBarDataState) {
            _tabController = TabController(
              initialIndex: 0,
              length: state.items.length,
              vsync: this,
            );
            _tabController.animation!.addListener(_onTabAnimation);

            return Scaffold(
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: state.items
                    .map((item) {
                      return MainItemWidget(
                        getWidgetByPath(
                              item.data['path'],
                              data: item.data,
                            ) ??
                            Scaffold(
                              appBar: AppBar(title: const Text('Not Found')),
                              body: Center(
                                  child: Text(
                                      'Route not defined: ${item.data['path']}')),
                            ),
                      );
                    })
                    .toList()
                    .cast<Widget>(),
              ),
              bottomNavigationBar: ValueListenableBuilder<int>(
                valueListenable: _currentIndexNotifier,
                builder: (context, index, child) => BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: index,
                  onTap: (int index) => _setIndex(index),
                  items: state.items
                      .map(
                        (item) => BottomNavigationBarItem(
                          icon: item.icon,
                          label: item.label,
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  int _indexFromPath(String path) {
    return _tabItems.indexWhere((item) => item.path == path);
  }

  @override
  bool canNavigate(String path) {
    return _indexFromPath(path) > -1;
  }

  @override
  navigateToPath(String path) {
    int targetIndex = _indexFromPath(path);
    _setIndex(targetIndex);
  }

  @override
  bool isHomePage() {
    return _tabController.index == 0;
  }

  void _setIndex(int index) {
    if (_tabController.index != index) {
      hideNotification();
      _tabController.index = index;
      tbContext.bottomNavigationTabChangedStream.add(index);
    }
  }

  Widget? getWidgetByPath(String path, {Map<String, dynamic>? data}) {
    if (path == '/dashboard') {
      return SingleDashboardView(
        tbContext,
        id: data?['id'],
      );
    }

    // Find the route by its path
    final match = tbContext.router.match(path);
    if (match != null && match.route.handler != null) {
      // Execute the handler's function to retrieve the widget
      return match.route.handler?.handlerFunc(null, match.parameters);
    }

    return null;
  }
}
