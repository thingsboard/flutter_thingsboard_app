import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/di/alarm_types_di.dart';
import 'package:thingsboard_app/modules/alarm/di/assignee_di.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

class AlarmsDi {
  static void init(
    final String scopeName, {
    required ThingsboardClient tbClient,
  }) {
    getIt.pushNewScope(
      scopeName: scopeName,
      init: (locator) {
        AlarmTypesDi.init(tbClient);
        AssigneeDi.inti(tbClient);
      },
    );
  }

  static void dispose(final String scopeName) {
    AlarmTypesDi.dispose();
    AssigneeDi.dispose();
    getIt.dropScope(scopeName);
  }
}
