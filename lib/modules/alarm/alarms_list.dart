import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import 'alarms_base.dart';

class AlarmsList extends BaseEntitiesWidget<AlarmInfo, AlarmQuery>
    with AlarmsBase, EntitiesListStateBase {
  AlarmsList(
      TbContext tbContext, PageKeyController<AlarmQuery> pageKeyController,
      {searchMode = false})
      : super(tbContext, pageKeyController, searchMode: searchMode);
}
