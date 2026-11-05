import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';

class Cryptor {
  static const MethodChannel _channel =
      MethodChannel('esp_provisioning_softap');

  Future<bool> init(Uint8List key, Uint8List iv) async {
    return await _channel.invokeMethod('init', {
      'key': key,
      'iv': iv,
    });
  }

  Future<Uint8List> crypt(Uint8List data) async {
    return await _channel.invokeMethod(
      'crypt',
      {
        'data': data,
      },
    );
  }
}
