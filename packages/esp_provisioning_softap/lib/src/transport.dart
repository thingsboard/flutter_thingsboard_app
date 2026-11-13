import 'dart:typed_data';

abstract class Transport {
  Future<bool> connect();

  Future<void> disconnect();

  Future<Uint8List?> sendReceive(String epName, Uint8List data);
}
