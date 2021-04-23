import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';

class DeviceInfoCard extends StatelessWidget {

  final DeviceInfo device;
  final void Function(DeviceInfo device)? onDetails;

  DeviceInfoCard(this.device, {this.onDetails});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: ListTile(
            title: Text('${device.name}'),
            subtitle: Text('${device.type}'),
            trailing: IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                if (onDetails != null) {
                  onDetails!(device);
                }
              },
            ),
          )
        )
    );
  }

}

class FirstPageExceptionIndicator extends StatelessWidget {
  const FirstPageExceptionIndicator({
    required this.title,
    this.message,
    this.onTryAgain,
    Key? key,
  }) : super(key: key);

  final String title;
  final String? message;
  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) {
    final message = this.message;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            if (message != null)
              const SizedBox(
                height: 16,
              ),
            if (message != null)
              Text(
                message,
                textAlign: TextAlign.center,
              ),
            if (onTryAgain != null)
              const SizedBox(
                height: 48,
              ),
            if (onTryAgain != null)
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: onTryAgain,
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Try Again',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class DevicesPage extends TbPageWidget<DevicesPage, _DevicesPageState> {

  DevicesPage(TbContext tbContext) : super(tbContext);

  @override
  _DevicesPageState createState() => _DevicesPageState();

}

class _DevicesPageState extends TbPageState<DevicesPage, _DevicesPageState> {

  final _searchModeNotifier = ValueNotifier<bool>(false);

  final PagingController<PageLink, DeviceInfo> _pagingController = PagingController(firstPageKey: PageLink(10));

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  bool dataLoading = false;
  bool scheduleRefresh = false;

  void refresh() {
    if (dataLoading) {
      scheduleRefresh = true;
    } else {
      _pagingController.refresh();
    }
  }

  Future<void> _fetchPage(PageLink pageKey) async {
    dataLoading = true;
    try {
      hideNotification();
      final pageData = await tbContext.tbClient.getDeviceService().getTenantDeviceInfos(pageKey);
      final isLastPage = !pageData.hasNext;
      if (isLastPage) {
        _pagingController.appendLastPage(pageData.data);
      } else {
        final nextPageKey = pageKey.nextPageLink();
        _pagingController.appendPage(pageData.data, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    } finally {
      dataLoading = false;
      if (scheduleRefresh) {
        scheduleRefresh = false;
        _pagingController.refresh();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppBar(
        tbContext,
        title: const Text('Devices'),
        searchModeNotifier: _searchModeNotifier,
        searchHint: 'Search devices',
        onSearch: (String searchText) {
          _pagingController.firstPageKey.textSearch = searchText;
          refresh();
        },
      ),
      body: Builder(
        builder: (BuildContext context) {
          return PagedListView(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<DeviceInfo>(
              itemBuilder: (context, item, index) {
                return DeviceInfoCard(
                    item,
                    onDetails: (device) {
                      print('open details: $device');
                    },
                );
              },
              noMoreItemsIndicatorBuilder: (context) => FirstPageExceptionIndicator(
                title: 'No more devices'
              ),
              noItemsFoundIndicatorBuilder: (context) => FirstPageExceptionIndicator(
                title: 'No devices found',
                message: 'The list is currently empty.',
                onTryAgain: () => refresh(),
              )
             ),
            );
        }
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed: () {
              refresh();
            },),
            Spacer(),
            IconButton(icon: Icon(Icons.search), onPressed: () {
              _searchModeNotifier.value = true;
            }),
            _simplePopup(),
          ],
        ),
      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add), onPressed: () {},),

      /* SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.white,
        visible: true,
        curve: Curves.bounceIn,
        children: [
          // FAB 1
          SpeedDialChild(
            child: Icon(Icons.refresh),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Colors.white,
            onTap: () {
              refresh();
             /* setState(() {
                var rng = Random();
                var pageSize =  1 + rng.nextInt(9);
                futureDevices = tbContext.tbClient.getDeviceService().getTenantDeviceInfos(PageLink(pageSize));
              }); */
            },
            label: 'Refresh',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.0),
          ),
          // FAB 2
          SpeedDialChild(
            child: Icon(Icons.logout),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Colors.white,
            onTap: () {
              tbContext.tbClient.logout(requestConfig: RequestConfig(ignoreErrors: true));
            },
           label: 'Logout',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.0),
          )
        ],
      )*/
    );
  }

  Widget _simplePopup() => PopupMenuButton<int>(
    itemBuilder: (context) => [
      PopupMenuItem(
        value: 1,
        child: Text("First"),
      ),
      PopupMenuItem(
        value: 2,
        child: ListTile(
          leading: Icon(Icons.work),
          title: Text('Second'),
        )
      ),
    ],
    icon: Icon(Icons.settings),
  );

  SpeedDial speedDial(context) => SpeedDial(
    animatedIcon: AnimatedIcons.menu_close,
    animatedIconTheme: IconThemeData(size: 22),
    backgroundColor: Theme.of(context).colorScheme.secondary,
    foregroundColor: Colors.white,
    visible: true,
    curve: Curves.bounceIn,
    children: [
      // FAB 1
      SpeedDialChild(
        child: Icon(Icons.refresh),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.white,
        onTap: () {
          refresh();
          /* setState(() {
                var rng = Random();
                var pageSize =  1 + rng.nextInt(9);
                futureDevices = tbContext.tbClient.getDeviceService().getTenantDeviceInfos(PageLink(pageSize));
              }); */
        },
        label: 'Refresh',
        labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0),
      ),
      // FAB 2
      SpeedDialChild(
        child: Icon(Icons.logout),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.white,
        onTap: () {
          tbContext.tbClient.logout(requestConfig: RequestConfig(ignoreErrors: true));
        },
        label: 'Logout',
        labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0),
      )
    ],
  );
}
