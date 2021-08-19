import 'package:thingsboard_pe_client/thingsboard_client.dart';
import 'dart:html';

TbStorage createAppStorage() => TbWebLocalStorage();

class TbWebLocalStorage implements TbStorage {

  final Storage _localStorage = window.localStorage;

  @override
  Future<void> deleteItem(String key) async {
    _localStorage.remove(key);
  }

  @override
  Future<String?> getItem(String key) async {
    return _localStorage[key];
  }

  @override
  Future<void> setItem(String key, String value) async {
    _localStorage[key] = value;
  }

}
