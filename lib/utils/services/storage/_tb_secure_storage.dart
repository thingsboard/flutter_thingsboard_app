// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

TbStorage createAppStorage() => TbSecureStorage();

/// The app's key-value storage in the Android Keystore / iOS Keychain, as
/// JSON. Read once in [init] and kept in memory.
class TbSecureStorage implements TbStorage<Object?> {
  TbSecureStorage({
    FlutterSecureStorage? storage,
    Future<Directory> Function()? supportDirectory,
    Future<Directory> Function()? documentsDirectory,
  }) : _storage = storage ?? _defaultStorage,
       _supportDirectory = supportDirectory ?? getApplicationSupportDirectory,
       _documentsDirectory =
           documentsDirectory ?? getApplicationDocumentsDirectory;

  static const _defaultStorage = FlutterSecureStorage(
    // Readable while the device is locked after the first unlock, for push
    // and live tracking started in the background; never in a backup.
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  /// Marks an install that has started once. iOS keeps the Keychain after
  /// the app is deleted, so without it a reinstall would come back signed in.
  static const _installMarker = 'tb_storage_v2';

  final FlutterSecureStorage _storage;
  final Future<Directory> Function() _supportDirectory;
  final Future<Directory> Function() _documentsDirectory;
  final _values = <String, String>{};

  Future<void> init() async {
    try {
      final supportDir = await _supportDirectory();
      final marker = File('${supportDir.path}/$_installMarker');
      if (!marker.existsSync()) {
        // A new install, or the update from the 1.x storage (an encrypted
        // Hive box whose key was the only Keychain entry): start clean.
        await _storage.deleteAll();
        await _deleteHiveBox();
        marker.createSync(recursive: true);
      }
      _values.addAll(await _storage.readAll());
    } catch (_) {
      // Unreadable storage (e.g. a lost Keystore key): start signed out
      // rather than fail the app start.
      _values.clear();
      await _storage.deleteAll().catchError((_) {});
    }
  }

  Future<void> _deleteHiveBox() async {
    final dir = await _documentsDirectory();
    for (final name in ['securedstorage.hive', 'securedstorage.lock']) {
      final file = File('${dir.path}/$name');
      if (file.existsSync()) file.deleteSync();
    }
  }

  @override
  Future<void> setItem(String key, Object? value) async {
    final encoded = jsonEncode(value);
    _values[key] = encoded;
    await _storage.write(key: key, value: encoded);
  }

  @override
  Future<void> deleteItem(String key) async {
    _values.remove(key);
    await _storage.delete(key: key);
  }

  @override
  Future<Object?> getItem(String key, {Object? defaultValue}) async {
    final encoded = _values[key];
    return encoded == null ? defaultValue : jsonDecode(encoded);
  }

  @override
  Future<bool> containsKey(String key) async => _values.containsKey(key);
}
