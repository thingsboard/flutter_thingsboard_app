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
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomBarBloc>(
      create: (_) => BottomBarBloc()..add(const BottomBarFetchEvent()),
      child: BlocBuilder<BottomBarBloc, BottomBarState>(
        builder: (context, state) {
          switch (state) {
            case BottomBarLoadingState():
              return Scaffold(
                body: Center(
                  child: TbProgressIndicator(
                    tbContext,
                    size: 50,
                  ),
                ),
              );

            case BottomBarDataState():
              _tabController = TabController(
                initialIndex: _currentIndexNotifier.value,
                length: state.items.length,
                vsync: this,
              );

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
        },
      ),
    );
  }

  void _setIndex(int index) {
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
