import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/view/single_dashboard_view.dart';
import 'package:thingsboard_app/modules/main/bloc/bottom_bar_bloc.dart';
import 'package:thingsboard_app/modules/main/main_item_widget.dart';
import 'package:thingsboard_app/modules/main/main_navigation_item.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class MainPage extends TbPageWidget {
  MainPage(super.tbContext, {super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends TbPageState<MainPage>
    with TickerProviderStateMixin {
  final _currentIndexNotifier = ValueNotifier(0);
  late final List<TbMainNavigationItem> _tabItems;
  late TabController _tabController;
  late final BottomBarBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = BottomBarBloc(router: tbContext.router)
      ..add(BottomBarFetchEvent(context));
  }

  @override
  void dispose() {
    // _tabController.animation!.removeListener(_onTabAnimation);
    bloc.close();
    super.dispose();
  }

  // _onTabAnimation() {
  //   var value = _tabController.animation!.value;
  //   int targetIndex;
  //   if (value >= _tabController.previousIndex) {
  //     targetIndex = value.round();
  //   } else {
  //     targetIndex = value.floor();
  //   }
  //   _currentIndexNotifier.value = targetIndex;
  // }

  // @override
  // Future<bool> willPop() async {
  //   if (_tabController.index > 0) {
  //     _setIndex(0);
  //     return false;
  //   }
  //   return true;
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomBarBloc>.value(
      value: bloc,
      child: BlocBuilder<BottomBarBloc, BottomBarState>(
        builder: (context, state) {
          if (state is BottomBarLoadingState) {
            return Scaffold(
              body: TbProgressIndicator(
                tbContext,
                size: 50,
              ),
            );
          } else if (state is BottomBarDataState) {
            _tabController = TabController(
              initialIndex: _currentIndexNotifier.value,
              length: state.items.length,
              vsync: this,
            );
            // _tabController.animation!.addListener(_onTabAnimation);

            TbMainNavigationItem.mainPageStateMap.addAll(
              state.items.map((e) => e.data['path']),
            );

            print('build');

            return Scaffold(
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: state.items
                    .map(
                      (e) => MainItemWidget(
                        getWidgetByPath(e.data['path'], data: e.data),
                        path: e.data['path'],
                      ),
                    )
                    .toList(),
              ),
              bottomNavigationBar: ValueListenableBuilder<int>(
                valueListenable: _currentIndexNotifier,
                builder: (context, index, child) => TbNavigationBarWidget(
                  currentIndex: _currentIndexNotifier.value,
                  onTap: (int index) => _setIndex(index),
                  customBottomBarItems: state.items
                      .map(
                        (e) => TbMainNavigationItem(
                          page: MainItemWidget(
                            getWidgetByPath(e.data['path'], data: e.data),
                            path: e.data['path'],
                          ),
                          title: e.label,
                          icon: e.icon,
                          path: e.data['path'],
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

  // int _indexFromPath(String path) {
  //   return _tabItems.indexWhere((item) => item.path == path);
  // }

  // @override
  // bool canNavigate(String path) {
  //   return _indexFromPath(path) > -1;
  // }
  //
  // @override
  // navigateToPath(String path) {
  //   int targetIndex = _indexFromPath(path);
  //   _setIndex(targetIndex);
  // }
  //
  // @override
  // bool isHomePage() {
  //   return _tabController.index == 0;
  // }

  void _setIndex(int index) {
    print('_setIndex($index) ${_tabController.index}');

    if (_tabController.index != index) {
      hideNotification();
      _tabController.index = index;
      _currentIndexNotifier.value = index;
      tbContext.bottomNavigationTabChangedStream.add(index);
    }
  }

  Widget? getWidgetByPath(String path, {Map<String, dynamic>? data}) {
    if (path == '/dashboard') {
      return SingleDashboardView(tbContext, id: data?['id']);
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
