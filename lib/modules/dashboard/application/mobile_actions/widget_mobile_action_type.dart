// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

enum WidgetMobileActionType {
  takePictureFromGallery,
  takePhoto,
  mapDirection,
  mapLocation,
  scanQrCode,
  makePhoneCall,
  getLocation,
  startLiveLocation,
  stopLiveLocation,
  takeScreenshot,
  deviceProvision,
  unknown;

  static WidgetMobileActionType fromString(String value) {
    return WidgetMobileActionType.values.firstWhere(
      (e) => e.toString().split('.')[1].toUpperCase() == value.toUpperCase(),
      orElse: () => WidgetMobileActionType.unknown,
    );
  }
}
