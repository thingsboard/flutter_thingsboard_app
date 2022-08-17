import 'package:thingsboard_client/thingsboard_client.dart';
import 'package:universal_html/html.dart' as html;

TbStorage createAppStorage() => TbWebLocalStorage();

class TbWebLocalStorage implements TbStorage {
  final html.Storage _localStorage = html.window.localStorage;

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
