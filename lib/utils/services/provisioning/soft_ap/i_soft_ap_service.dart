import 'dart:typed_data' show Uint8List;

import 'package:esp_provisioning_softap/esp_provisioning_softap.dart';

abstract interface class ISoftApService {
  Future<Provisioning> startProvisioning({
    required String hostname,
    required String pop,
  });

  Future<List<Map<String, dynamic>>?> startScanWiFi(Provisioning prov);

  Future<Uint8List> sendReceiveCustomData(
    Provisioning prov, {
    required Uint8List data,
    int packageSize = 256,
    String endpoint = 'custom-data',
  });

  Future<bool> sendWifiConfig(
    Provisioning prov, {
    required String ssid,
    required String password,
  });

  Future<bool> applyWifiConfig(Provisioning prov);

  Future<ConnectionStatus> getStatus(Provisioning prov);
}
