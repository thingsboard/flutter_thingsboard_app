
import 'package:esp_smartconfig/esp_smartconfig.dart';
import 'package:thingsboard_app/utils/services/provisioning/esp_smartconfig/i_esp_smartconfig_service.dart';

class EspSmartConfigService implements IEspSmartConfigService {
  const EspSmartConfigService(this.provisioner);

   final Provisioner provisioner;

  @override
  Provisioner create(SmartConfig config) {
    switch (config) {
      case SmartConfig.espTouch:
        return Provisioner.espTouch();
      case SmartConfig.espTouchV2:
        return Provisioner.espTouchV2();
    }
  }

  @override
  Future<void> start(ProvisioningRequest request)  {
    return provisioner.start(request);
  }

  @override
  Future<void> stop() async {
    provisioner.stop();
  }
}
