import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/bloc/bottom_bar_bloc.dart';
import 'package:thingsboard_app/modules/main/tb_navigation_bar_widget.dart';
import 'package:thingsboard_app/utils/services/layouts/i_layout_service.dart';
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
  late Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomBarBloc>(
      create: (_) => BottomBarBloc(
        layoutService: getIt<ILayoutService>(),
        tbContext: tbContext,
      )..add(const BottomBarFetchEvent()),
      child: BlocBuilder<BottomBarBloc, BottomBarState>(
        builder: (context, state) {
          switch (state) {
            case BottomBarDataState():
              if (_currentIndexNotifier.value > state.items.length) {
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
                    context
                        .read<BottomBarBloc>()
                        .add(const BottomBarOrientationChangedEvent());
                  }

                  return Scaffold(
                    body: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: state.items.map((e) => e.page).toList(),
                    ),
                    bottomNavigationBar: ValueListenableBuilder<int>(
                      valueListenable: _currentIndexNotifier,
                      builder: (context, index, child) => TbNavigationBarWidget(
                        currentIndex: _currentIndexNotifier.value,
                        onTap: (int index) => _setIndex(index),
                        customBottomBarItems: state.items,
                      ),
                    ),
                  );
                },
              );

            default:
              return Scaffold(
                body: Center(
                  child: TbProgressIndicator(tbContext, size: 50),
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

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      orientation = MediaQuery.of(context).orientation;
    });

    super.initState();
  }
}
