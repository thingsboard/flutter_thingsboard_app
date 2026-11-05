import 'dart:convert';

import 'package:thingsboard_app/constants/database_keys.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/live_location_tracking/i_live_tracking_store.dart';
import 'package:thingsboard_app/utils/services/live_location_tracking/model/last_tracking_record.dart';

class LiveTrackingStore implements ILiveTrackingStore {
  LiveTrackingStore({required TbStorage storage, required TbLogger logger})
    : _storage = storage,
      _log = logger;

  final TbStorage _storage;
  final TbLogger _log;

  @override
  Future<LastTrackingRecord?> read() async {
    try {
      final raw = await _storage.getItem(DatabaseKeys.liveTrackingLastRecord);
      if (raw is! String) {
        return null;
      }
      final record = LastTrackingRecord.fromJson(
        Map<String, dynamic>.from(jsonDecode(raw) as Map),
      );
      // The config is opaque to LastTrackingRecord.fromJson, so a record
      // written by another app version survives the parse above and only
      // fails when the config itself is read. Reject it here, where the
      // caller already handles null, rather than from a widget build.
      if (record.configOrNull == null) {
        _log.error('LiveTrackingStore.read: stored config cannot be parsed');
        return null;
      }
      return record;
    } catch (e, s) {
      _log.error('LiveTrackingStore.read failed', e, s);
      return null;
    }
  }

  @override
  Future<void> write(LastTrackingRecord record) async {
    try {
      await _storage.setItem(
        DatabaseKeys.liveTrackingLastRecord,
        jsonEncode(record.toJson()),
      );
    } catch (e, s) {
      _log.error('LiveTrackingStore.write failed', e, s);
    }
  }

  @override
  Future<void> clear() async {
    try {
      await _storage.deleteItem(DatabaseKeys.liveTrackingLastRecord);
    } catch (e, s) {
      _log.error('LiveTrackingStore.clear failed', e, s);
    }
  }
}
