import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/main/main_navigation_item.dart';
import 'package:thingsboard_app/modules/main/tb_navigation_bar_widget.dart';

class MainPage extends TbPageWidget {
  MainPage(
    TbContext tbContext, {
    super.key,
    required String path,
  })  : _path = path,
        super(tbContext);

  final String _path;

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends TbPageState<MainPage>
    with TbMainState, TickerProviderStateMixin {
  late ValueNotifier<int> _currentIndexNotifier;
  late final List<TbMainNavigationItem> _tabItems;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabItems = TbMainNavigationItem.getItems(tbContext);
    final currentIndex = _indexFromPath(widget._path);
    _tabController = TabController(
      initialIndex: currentIndex,
      length: _tabItems.length,
      vsync: this,
    );
    _currentIndexNotifier = ValueNotifier(currentIndex);
    _tabController.animation!.addListener(_onTabAnimation);
  }

  @override
  void dispose() {
    _tabController.animation!.removeListener(_onTabAnimation);
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

    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: _tabItems.map((item) => item.page).toList(),
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _currentIndexNotifier,
        builder: (context, index, child) => TbNavigationBarWidget(
          currentIndex: index,
          onTap: (int index) => _setIndex(index),
          customBottomBarItems: _tabItems,
        ),
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
}
