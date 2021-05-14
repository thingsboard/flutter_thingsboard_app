import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/alarm/alarms_page.dart';
import 'package:thingsboard_app/modules/dashboard/dashboards_page.dart';
import 'package:thingsboard_app/modules/device/devices_page.dart';
import 'package:thingsboard_app/modules/home/home_page.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class TbMainNavigationItem {
  final Widget page;
  final String title;
  final Icon icon;
  final String path;

  TbMainNavigationItem({
    required this.page,
    required this.title,
    required this.icon,
    required this.path
  });

  static Map<Authority, Set<String>> mainPageStateMap = {
    Authority.SYS_ADMIN: Set.unmodifiable(['/home', '/tenants', '/more']),
    Authority.TENANT_ADMIN: Set.unmodifiable(['/home', '/devices', '/dashboards', '/more']),
    Authority.CUSTOMER_USER: Set.unmodifiable(['/home', '/devices', '/dashboards', '/more']),
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
            path: '/home'
        )
      ];
      switch(tbContext.tbClient.getAuthUser()!.authority) {
        case Authority.SYS_ADMIN:
          items.add(TbMainNavigationItem(
              page: Scaffold(body: Center(child: Text('Tenants TODO'))),
              title: 'Tenants',
              icon: Icon(Icons.supervisor_account),
              path: '/tenants'
          ));
          break;
        case Authority.TENANT_ADMIN:
        case Authority.CUSTOMER_USER:
        items.addAll([
          TbMainNavigationItem(
              page: AlarmsPage(tbContext),
              title: 'Alarms',
              icon: Icon(Icons.notifications),
              path: '/alarms'
          ),
          TbMainNavigationItem(
            page: DevicesPage(tbContext),
            title: 'Devices',
            icon: Icon(Icons.devices_other),
            path: '/devices'
          )
        ]);
        break;
        case Authority.REFRESH_TOKEN:
          break;
        case Authority.ANONYMOUS:
          break;
      }
      items.add(TbMainNavigationItem(
          page: Scaffold(body: Center(child: Text('TODO'))),
          title: 'More',
          icon: Icon(Icons.menu),
          path: '/more'
      ));
      return items;
    } else {
      return [];
    }
  }
}

class MainPage extends TbPageWidget<MainPage, _MainPageState> {

  final String _path;

  MainPage(TbContext tbContext, {required String path}):
        _path = path, super(tbContext) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(tbContext.currentState!.context).colorScheme.primary,
        systemNavigationBarIconBrightness: Brightness.dark
    ));
  }

  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends TbPageState<MainPage, _MainPageState> with TbMainState {

  late int _currentIndex;

  late final List<TbMainNavigationItem> _tabItems;

  @override
  void initState() {
    super.initState();
    _tabItems = TbMainNavigationItem.getItems(tbContext);
    _currentIndex = _indexFromPath(widget._path);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (_currentIndex > 0) {
            setState(() => _currentIndex = 0);
            return false;
          }
          return true;
        },
        child: Scaffold(
          /* body: IndexedStack(
          index: _currentIndex,
          children: _tabItems.map((item) => item.page).toList(),
        ),*/
            body: _tabItems.elementAt(_currentIndex).page,
            bottomNavigationBar: Theme(
                data: Theme.of(context).copyWith(
                    canvasColor: Theme.of(context).colorScheme.primary
                ),
                child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.white.withAlpha(97),
                    currentIndex: _currentIndex,
                    onTap: (int index) => setState(() => _currentIndex = index),
                    items: _tabItems.map((item) => BottomNavigationBarItem(
                        icon: item.icon,
                        label: item.title
                    )).toList()
                )
            )
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
    if (_currentIndex != targetIndex) {
      setState(() => _currentIndex = targetIndex);
    }
  }

}
