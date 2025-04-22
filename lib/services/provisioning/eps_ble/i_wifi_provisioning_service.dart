abstract interface class IBleProvisioningService {
  Future<List<String>> scanBleDevices(String prefix);

  Future<List<String>> scanWifiNetworks({
    required String deviceName,
    required String proofOfPossession,
  });

  Future<bool?> provisionWifi({
    required String deviceName,
    required String proofOfPossession,
    required String ssid,
    required String passphrase,
  });

  Future<String?> getPlatformVersion();
}
