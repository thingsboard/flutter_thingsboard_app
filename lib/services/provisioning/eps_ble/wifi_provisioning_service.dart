import 'package:flutter_esp_ble_prov/flutter_esp_ble_prov.dart';
import 'package:thingsboard_app/services/provisioning/eps_ble/i_wifi_provisioning_service.dart';

class BleProvisioningService implements IBleProvisioningService {
  BleProvisioningService([FlutterEspBleProv? prov])
      : espBleProv = prov ?? FlutterEspBleProv();

  final FlutterEspBleProv espBleProv;

  @override
  Future<bool?> provisionWifi({
    required String deviceName,
    required String proofOfPossession,
    required String ssid,
    required String passphrase,
  }) async {
    return espBleProv.provisionWifi(
      deviceName,
      proofOfPossession,
      ssid,
      passphrase,
    );
  }

  @override
  Future<List<String>> scanBleDevices(String prefix) async {
    return espBleProv.scanBleDevices(prefix);
  }

  @override
  Future<List<String>> scanWifiNetworks({
    required String deviceName,
    required String proofOfPossession,
  }) async {
    return espBleProv.scanWifiNetworks(deviceName, proofOfPossession);
  }

  @override
  Future<String?> getPlatformVersion() {
    return espBleProv.getPlatformVersion();
  }
}
