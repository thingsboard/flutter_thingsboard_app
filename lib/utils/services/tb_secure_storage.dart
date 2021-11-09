import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

TbStorage createAppStorage() => TbSecureStorage();

class TbSecureStorage implements TbStorage {
  final flutterStorage = FlutterSecureStorage();

  @override
  Future<void> deleteItem(String key) async {
    return await flutterStorage.delete(key: key);
  }

  @override
  Future<String?> getItem(String key) async {
    return await flutterStorage.read(key: key);
  }

  @override
  Future<void> setItem(String key, String value) async {
    return await flutterStorage.write(key: key, value: value);
  }
}
