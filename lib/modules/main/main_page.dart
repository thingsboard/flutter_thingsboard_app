import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/features/layouts/bloc/layouts_bloc.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/tb_navigation_bar_widget.dart';
import 'package:thingsboard_app/services/legacy/i_legacy_service.dart';
import 'package:thingsboard_app/services/logger/i_logger_service.dart';
import 'package:thingsboard_app/services/notification_service.dart';
import 'package:thingsboard_app/utils/ui/tost_notifications_extension.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  final _currentIndexNotifier = ValueNotifier(0);
  late TabController _tabController;
  late Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LayoutsBloc>(
      create: (_) => LayoutsBloc.create()..add(BottomBarFetchEvent(context)),
      child: BlocBuilder<LayoutsBloc, LayoutsState>(
        builder: (context, state) {
          switch (state) {
            case BottomBarDataState():
              if (_currentIndexNotifier.value >= state.items.length) {
                _currentIndexNotifier.value = state.items.length - 1;
                _tabController.index = _currentIndexNotifier.value;
              }

              _tabController = TabController(
                initialIndex: _currentIndexNotifier.value,
                length: state.items.length,
                vsync: this,
              );

              return OrientationBuilder(
                builder: (context, orientation) {
                  if (this.orientation != orientation) {
                    this.orientation = orientation;
                    context.read<LayoutsBloc>().add(
                          BottomBarOrientationChangedEvent(
                            orientation,
                            MediaQuery.of(context).size,
                          ),
                        );
                  }

                  return Scaffold(
                    body: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: state.items.map((e) => e.page).toList(),
                    ),
                    bottomNavigationBar: ValueListenableBuilder<int>(
                      valueListenable: _currentIndexNotifier,
                      builder: (_, __, ___) => TbNavigationBarWidget(
                        currentIndex: _currentIndexNotifier.value,
                        onTap: (index) => _setIndex(index),
                        customBottomBarItems: state.items,
                      ),
                    ),
                  );
                },
              );

            default:
              return const Scaffold(
                body: Center(
                  child: TbProgressIndicator(size: 50),
                ),
              );
          }
        },
      ),
    );
  }

  void _setIndex(int index) {
    if (_tabController.index != index) {
      context.hideNotifications();
      _tabController.index = index;
      _currentIndexNotifier.value = index;
      getIt<ILegacyService>()
          .tbContext
          .bottomNavigationTabChangedStream
          .add(index);
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      orientation = MediaQuery.of(context).orientation;
      final tbContext = getIt<ILegacyService>().tbContext;
      NotificationService(
        tbContext.tbClient,
        getIt<ILoggerService>(),
        tbContext,
      ).updateNotificationsCount();
    });

    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      final tbContext = getIt<ILegacyService>().tbContext;
      NotificationService(
        tbContext.tbClient,
        getIt<ILoggerService>(),
        tbContext,
      ).updateNotificationsCount();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
