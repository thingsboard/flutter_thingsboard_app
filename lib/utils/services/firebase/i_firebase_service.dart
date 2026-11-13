// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:firebase_core/firebase_core.dart';

abstract interface class IFirebaseService {
  const IFirebaseService();

  Future<FirebaseApp?> initializeApp({String name, FirebaseOptions? options});

  Future<void> removeApp({String name});
  Future<void> clearApps();
  List<String> get apps;
}
