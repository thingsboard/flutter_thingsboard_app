import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/view/single_dashboard_view.dart';
import 'package:thingsboard_app/modules/main/bottom_bar_model.dart';
import 'package:thingsboard_app/modules/main/main_item_widget.dart';
import 'package:thingsboard_app/modules/main/main_navigation_item.dart';
import 'package:thingsboard_app/utils/services/layouts/i_layout_service.dart';

class BottomBarBloc extends Bloc<BottomBarEvent, BottomBarState> {
  BottomBarBloc({
    required this.layoutService,
    required this.tbContext,
  }) : super(const BottomBarLoadingState()) {
    on(_onEvent);
  }

  late final List<BottomBarModel> items;
  final ILayoutService layoutService;
  final TbContext tbContext;

  Future<void> _onEvent(
    BottomBarEvent event,
    Emitter<BottomBarState> emit,
  ) async {
    switch (event) {
      case BottomBarFetchEvent():
        items = [
          const BottomBarModel(
            label: 'Notifications',
            icon: Icons.notifications_outlined,
            data: {'path': '/notifications'},
          ),
          const BottomBarModel(
            label: 'Dashboards',
            icon: Icons.dashboard_outlined,
            data: {'path': '/dashboards'},
          ),
          const BottomBarModel(
            label: 'Fuel Level Monitoring',
            icon: Icons.dashboard_outlined,
            data: {
              'path': '/dashboard',
              'id': '8a8d81b0-5975-11ef-83b1-d3209c242a36',
            },
          ),
          const BottomBarModel(
            label: 'Devices',
            icon: Icons.devices_outlined,
            data: {'path': '/devices'},
          ),
          const BottomBarModel(
            label: 'Devices',
            icon: Icons.devices_outlined,
            data: {'path': '/devices'},
          ),
          const BottomBarModel(
            label: 'Alarms',
            icon: Icons.alarm_outlined,
            data: {'path': '/alarms'},
          ),
          const BottomBarModel(
            label: 'Customers',
            icon: Icons.alarm_outlined,
            data: {'path': '/customers'},
          ),
          const BottomBarModel(
            label: 'Customers',
            icon: Icons.alarm_outlined,
            data: {'path': '/customers'},
          ),
          const BottomBarModel(
            label: 'Customers',
            icon: Icons.alarm_outlined,
            data: {'path': '/customers'},
          ),
        ];

        layoutService.setBottomBarItems(
          items
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
          more: TbMainNavigationItem(
            page: MainItemWidget(
              getWidgetByPath('/more'),
              path: '/more',
            ),
            title: 'More',
            icon: Icons.menu_outlined,
            path: '/more',
          ),
        );

        emit(BottomBarDataState(items: layoutService.getBottomBarItems()));
        break;
      case BottomBarOrientationChangedEvent():
        emit(BottomBarDataState(items: layoutService.getBottomBarItems()));

        break;
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

/// Event
sealed class BottomBarEvent extends Equatable {
  const BottomBarEvent();

  @override
  List<Object?> get props => [];
}

final class BottomBarFetchEvent extends BottomBarEvent {
  const BottomBarFetchEvent();
}

final class BottomBarOrientationChangedEvent extends BottomBarEvent {
  const BottomBarOrientationChangedEvent();
}

/// State
sealed class BottomBarState extends Equatable {
  const BottomBarState();

  @override
  List<Object?> get props => [];
}

final class BottomBarLoadingState extends BottomBarState {
  const BottomBarLoadingState();
}

final class BottomBarDataState extends BottomBarState {
  const BottomBarDataState({required this.items});

  final List<TbMainNavigationItem> items;

  @override
  List<Object?> get props => [items];
}
