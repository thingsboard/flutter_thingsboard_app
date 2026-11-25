// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/utils/services/storage/tb_secure_storage.dart';

void main() {
  late Directory support;
  late Directory documents;

  setUp(() {
    support = Directory.systemTemp.createTempSync('support');
    documents = Directory.systemTemp.createTempSync('documents');
    addTearDown(() {
      support.deleteSync(recursive: true);
      documents.deleteSync(recursive: true);
    });
  });

  Future<TbSecureStorage> open() async {
    final storage = TbSecureStorage(
      storage: const FlutterSecureStorage(),
      supportDirectory: () async => support,
      documentsDirectory: () async => documents,
    );
    await storage.init();
    return storage;
  }

  test('keeps strings and booleans across starts', () async {
    FlutterSecureStorage.setMockInitialValues({});
    final first = await open();
    await first.setItem('jwt_token', 'token');
    await first.setItem('pushRegistered', true);

    final second = await open();
    expect(await second.getItem('jwt_token'), 'token');
    expect(await second.getItem('pushRegistered'), true);
    expect(await second.containsKey('jwt_token'), isTrue);

    await second.deleteItem('jwt_token');
    expect(await (await open()).getItem('jwt_token'), isNull);
  });

  test('a new install drops what the Keychain kept', () async {
    // iOS keeps Keychain items after the app is deleted.
    FlutterSecureStorage.setMockInitialValues({'jwt_token': '"old"'});

    final storage = await open();

    expect(await storage.getItem('jwt_token'), isNull);
  });

  test('the update from 1.x removes the Hive box and its key', () async {
    FlutterSecureStorage.setMockInitialValues({'key': 'hive-key'});
    final box = File('${documents.path}/securedstorage.hive')
      ..writeAsStringSync('encrypted');
    final lock = File('${documents.path}/securedstorage.lock')
      ..writeAsStringSync('');

    final storage = await open();

    expect(box.existsSync(), isFalse);
    expect(lock.existsSync(), isFalse);
    expect(await storage.containsKey('key'), isFalse);
  });
}
