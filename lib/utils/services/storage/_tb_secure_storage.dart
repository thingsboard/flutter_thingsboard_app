// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

TbStorage createAppStorage() => TbSecureStorage();

class TbSecureStorage<T> implements TbStorage {
  late Box encryptedBox;

  Future<void> init() async {
    const secureStorage = FlutterSecureStorage();
    // if key not exists return null
    final encryptionKeyString = await secureStorage.read(key: 'key');
    if (encryptionKeyString == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    }

    final key = await secureStorage.read(key: 'key');
    final encryptionKeyUint8List = base64Url.decode(key!);

    encryptedBox = await Hive.openBox(
      'securedStorage',
      encryptionCipher: HiveAesCipher(encryptionKeyUint8List),
    );
  }

  @override
  Future<void> deleteItem(dynamic key) async {
    return await encryptedBox.delete(key);
  }

  @override
  Future<T>? getItem(dynamic key, {dynamic defaultValue}) async {
    return encryptedBox.get(key) as T;
  }

  @override
  Future<void> setItem(dynamic key, dynamic value) async {
    return await encryptedBox.put(key, value);
  }

  @override
  Future<bool> containsKey(dynamic key) async {
    return encryptedBox.containsKey(key);
  }
}
