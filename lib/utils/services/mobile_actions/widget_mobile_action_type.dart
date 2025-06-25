enum WidgetMobileActionType {
  takePictureFromGallery,
  takePhoto,
  mapDirection,
  mapLocation,
  scanQrCode,
  makePhoneCall,
  getLocation,
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
