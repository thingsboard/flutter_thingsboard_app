import Flutter
import UIKit

public class SwiftEspSoftapProvisioningPlugin: NSObject, FlutterPlugin {
  private var cryptoAES: CryptoAES?
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "esp_provisioning_softap", binaryMessenger: registrar.messenger())
    let instance = SwiftEspSoftapProvisioningPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

    if call.method == "init" {
        let args = call.arguments as! NSDictionary
        let key = args["key"] as! FlutterStandardTypedData
        let iv = args["iv"] as! FlutterStandardTypedData
        cryptoAES = CryptoAES(key: key.data, iv: iv.data)
        result(true)
    } else if call.method == "crypt" {
        let args = call.arguments as! NSDictionary
        let data = args["data"] as! FlutterStandardTypedData
        guard let cryptoAES = self.cryptoAES else {
            return
        }
        let ret = cryptoAES.encrypt(data: data.data)

        result(FlutterStandardTypedData(bytes: ret!))
    }
    result("iOS " + UIDevice.current.systemVersion)
  }

}
