import 'package:built_collection/built_collection.dart';
import 'package:thingsboard_app/modules/alarm/domain/pagination/alarm_query_keys.dart';
import 'package:thingsboard_app/modules/alarm/data/datasource/alarms/i_alarms_datasource.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/new_client_page_data.dart';

class AlarmsDatasource implements IAlarmsDatasource {
  const AlarmsDatasource({required this.thingsboardClient});

  final ThingsboardClient thingsboardClient;

  @override
  Future<PageData<AlarmInfo>> fetchAlarms(AlarmQueryV2 query) async {
    final response = await thingsboardClient
        .getAlarmControllerApi()
        .getAllAlarmsV2(
          pageSize: query.pageLink.pageSize,
          page: query.pageLink.page,
          textSearch: query.pageLink.textSearch,
          sortProperty: query.pageLink.sortOrder?.property,
          sortOrder: query.pageLink.sortOrder?.direction.name,
          startTime: query.pageLink.startTime,
          endTime: query.pageLink.endTime,
          statusList:
              query.statusList != null
                  ? BuiltList<String>(query.statusList!.map((s) => s.name))
                  : null,
          severityList:
              query.severityList != null
                  ? BuiltList<String>(query.severityList!.map((s) => s.name))
                  : null,
          typeList:
              query.typeList != null
                  ? BuiltList<String>(query.typeList!)
                  : null,
          assigneeId: query.assigneeId?.id,
        );
    final page = response.data!;
    return toPageData(
      page.data,
      page.totalPages,
      page.totalElements,
      page.hasNext,
    );
  }

  @override
  Future<AlarmInfo?> getAlarmInfo(String id) async {
    final response = await thingsboardClient
        .getAlarmControllerApi()
        .getAlarmInfoById(alarmId: id);
    return response.data;
  }
}
