import Flutter
import UIKit

public class EspSoftapProvisioningPlugin: NSObject, FlutterPlugin {
  private var cryptoAES: CryptoAES?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "esp_provisioning_softap", binaryMessenger: registrar.messenger())
    let instance = EspSoftapProvisioningPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let args = call.arguments as? [String: Any]
    switch call.method {
    case "init":
      guard let key = args?["key"] as? FlutterStandardTypedData,
            let iv = args?["iv"] as? FlutterStandardTypedData else {
        result(FlutterError(code: "bad_args", message: "init needs key and iv", details: nil))
        return
      }
      cryptoAES = CryptoAES(key: key.data, iv: iv.data)
      result(true)
    case "crypt":
      guard let data = args?["data"] as? FlutterStandardTypedData else {
        result(FlutterError(code: "bad_args", message: "crypt needs data", details: nil))
        return
      }
      guard let encrypted = cryptoAES?.encrypt(data: data.data) else {
        result(FlutterError(code: "crypt_failed", message: "call init with a 32-byte key first", details: nil))
        return
      }
      result(FlutterStandardTypedData(bytes: encrypted))
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
