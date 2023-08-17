import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:thingsboard_app/constants/app_colors.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/alarm/alarms_page.dart';
import 'package:thingsboard_app/modules/device/devices_main_page.dart';
import 'package:thingsboard_app/modules/home/home_page.dart';
import 'package:thingsboard_app/modules/more/more_page.dart';
import 'package:thingsboard_app/widgets/app_bar_painter.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class TbMainNavigationItem {
  final Widget page;
  String title;
  final Icon icon;
  final String path;

  Icon get whiteIcon {
    return Icon(icon.icon, color: AppColors.backgroundColor,);
  }

  TbMainNavigationItem(
      {required this.page,
      required this.title,
      required this.icon,
      required this.path});

  static Map<Authority, Set<String>> mainPageStateMap = {
    Authority.SYS_ADMIN: Set.unmodifiable(['/home', '/more']),
    Authority.TENANT_ADMIN:
        Set.unmodifiable(['/home', '/alarms', '/devices', '/more']),
    Authority.CUSTOMER_USER:
        Set.unmodifiable(['/home', '/alarms', '/devices', '/more']),
  };

  static bool isMainPageState(TbContext tbContext, String path) {
    if (tbContext.isAuthenticated) {
      return mainPageStateMap[tbContext.tbClient.getAuthUser()!.authority]!
          .contains(path);
    } else {
      return false;
    }
  }

  static List<TbMainNavigationItem> getItems(TbContext tbContext) {
    if (tbContext.isAuthenticated) {
      List<TbMainNavigationItem> items = [
        TbMainNavigationItem(
            page: HomePage(tbContext),
            title: 'Home',
            icon: Icon(Icons.home),
            path: '/home')
      ];
      switch (tbContext.tbClient.getAuthUser()!.authority) {
        case Authority.SYS_ADMIN:
          break;
        case Authority.TENANT_ADMIN:
        case Authority.CUSTOMER_USER:
          items.addAll([
            TbMainNavigationItem(
                page: AlarmsPage(tbContext),
                title: 'Alarms',
                icon: Icon(Icons.notifications),
                path: '/alarms'),
            TbMainNavigationItem(
                page: DevicesMainPage(tbContext),
                title: 'Devices',
                icon: Icon(Icons.devices_other),
                path: '/devices')
          ]);
          break;
        case Authority.REFRESH_TOKEN:
          break;
        case Authority.ANONYMOUS:
          break;
        case Authority.PRE_VERIFICATION_TOKEN:
          break;
      }
      items.add(TbMainNavigationItem(
          page: MorePage(tbContext),
          title: 'More',
          icon: Icon(Icons.menu),
          path: '/more'));
      return items;
    } else {
      return [];
    }
  }

  static void changeItemsTitleIntl(
      List<TbMainNavigationItem> items, BuildContext context) {
    for (var item in items) {
      switch (item.path) {
        case '/home':
          item.title = '${S.of(context).home}';
          break;
        case '/alarms':
          item.title = '${S.of(context).alarms}';
          break;
        case '/devices':
          item.title = '${S.of(context).devices}';
          break;
        case '/more':
          item.title = '${S.of(context).more}';
          break;
      }
    }
  }
}

class MainPage extends TbPageWidget {
  final String _path;

  MainPage(TbContext tbContext, {required String path})
      : _path = path,
        super(tbContext);

  @override
  _MainPageState createState() => _MainPageState();
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
    int currentIndex = _indexFromPath(widget._path);
    _tabController = TabController(
        initialIndex: currentIndex, length: _tabItems.length, vsync: this);
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
    var targetIndex;
    if (value >= _tabController.previousIndex) {
      targetIndex = value.round();
    } else {
      targetIndex = value.floor();
    }
    _currentIndexNotifier.value = targetIndex;
  }

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    TbMainNavigationItem.changeItemsTitleIntl(_tabItems, context);
    return WillPopScope(
      onWillPop: () async {
        if (!await tbContext.willPop()) {
          return false;
        }
        if (_tabController.index > 0) {
          _setIndex(0);
          return false;
        }
        return true;
      },
      child: Scaffold(
        extendBody: true,
        body: TabBarView(
          physics: tbContext.homeDashboard != null
              ? NeverScrollableScrollPhysics()
              : null,
          controller: _tabController,
          children: _tabItems.map((item) => item.page).toList(),
        ),
      //   body: Stack(
      //   children: [
      //     TabBarView(
      //     physics: tbContext.homeDashboard != null
      //         ? NeverScrollableScrollPhysics()
      //         : null,
      //     controller: _tabController,
      //     children: _tabItems.map((item) => item.page).toList(),
      //   ),
      //     CustomPaint(
      //       painter: AppBarPainter(),
      //       child: Container(height: 0),
      //     ),
      //   ],
      // ),
        // bottomNavigationBar: ValueListenableBuilder<int>(
        //   valueListenable: _currentIndexNotifier,
        //   builder: (context, index, child) => BottomNavigationBar(
        //       type: BottomNavigationBarType.fixed,
        //       currentIndex: index,
        //       onTap: (int index) => _setIndex(index) /*_currentIndex = index*/,
        //       items: _tabItems
        //           .map((item) => BottomNavigationBarItem(
        //               icon: item.icon, label: item.title))
        //           .toList()),
        // ),
        backgroundColor: AppColors.backgroundColor,
        bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: _currentIndexNotifier,
          builder: (context, index, child) => CurvedNavigationBar(
            items: _tabItems
                .map(
                  (item) => item.whiteIcon,
                )
                .toList(),
            index: index,
            key: _bottomNavigationKey,
            onTap: (int index) => _setIndex(index) /*_currentIndex = index*/,
            height: 60,
            backgroundColor: Colors.transparent,
            color: AppColors.appBarColor,
            animationDuration: const Duration(milliseconds: 300),
          ),
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

  _setIndex(int index) {
    _tabController.index = index;
  }
}
