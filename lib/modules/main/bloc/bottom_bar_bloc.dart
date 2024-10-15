import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/modules/main/bottom_bar_model.dart';

class BottomBarBloc extends Bloc<BottomBarEvent, BottomBarState> {
  BottomBarBloc() : super(const BottomBarLoadingState()) {
    on(_onEvent);
  }

  Future<void> _onEvent(
    BottomBarEvent event,
    Emitter<BottomBarState> emit,
  ) async {
    switch (event) {
      case BottomBarFetchEvent():
        final items = [
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
            label: 'More',
            icon: Icons.menu_outlined,
            data: {'path': '/more'},
          ),
        ];

        emit(BottomBarDataState(items: items));
        break;
    }
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

  final List<BottomBarModel> items;

  @override
  List<Object?> get props => [];
}
