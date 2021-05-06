import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_page.dart';
import 'package:thingsboard_app/modules/device/devices_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class DevicesPage extends EntitiesPage<DeviceInfo> with DevicesBase {

  DevicesPage(TbContext tbContext) : super(tbContext);

  @override
  String get noMoreItemsText => 'No more devices';

  @override
  String get searchHint => 'Search devices';

}

/*      bottomNavigationBar: BottomAppBar(
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
          tbClient.logout(requestConfig: RequestConfig(ignoreErrors: true));
        },
        label: 'Logout',
        labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0),
      )
    ],
  );
}
*/
