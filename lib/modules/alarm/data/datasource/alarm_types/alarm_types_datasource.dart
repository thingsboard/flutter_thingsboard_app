import 'package:thingsboard_app/modules/alarm/data/datasource/alarm_types/i_alarm_types_datasource.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/new_client_page_data.dart';

class AlarmTypesDatasource implements IAlarmTypesDatasource {
  const AlarmTypesDatasource({required this.tbClient});

  final ThingsboardClient tbClient;

  @override
  Future<PageData<EntitySubtype>> fetchAlarmTypes(PageLink pageKey) async {
    final response = await tbClient.getAlarmControllerApi().getAlarmTypes(
      pageSize: pageKey.pageSize,
      page: pageKey.page,
      textSearch: pageKey.textSearch,
    );
    final page = response.data!;
    return toPageData(page.data, page.totalPages, page.totalElements, page.hasNext);
  }
}
