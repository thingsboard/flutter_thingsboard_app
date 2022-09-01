import 'dart:io';
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WidgetMobileActionResult<T extends MobileActionResult> {
  T? result;
  bool hasResult = false;
  String? error;
  bool hasError = false;

  WidgetMobileActionResult.errorResult(this.error)
      : hasError = true,
        hasResult = false;

  WidgetMobileActionResult.successResult(this.result)
      : hasError = false,
        hasResult = true;

  WidgetMobileActionResult.emptyResult()
      : hasError = false,
        hasResult = false;

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['hasError'] = hasError;
    json['hasResult'] = hasResult;
    json['error'] = error;
    json['result'] = result?.toJson();
    return json;
  }
}

class MobileActionResult {
  MobileActionResult();

  factory MobileActionResult.launched(bool launched) {
    return _LaunchResult(launched);
  }

  factory MobileActionResult.image(String imageUrl) {
    return _ImageResult(imageUrl);
  }

  factory MobileActionResult.qrCode(String code, String format) {
    return _QrCodeResult(code, format);
  }

  factory MobileActionResult.location(num latitude, num longitude) {
    return _LocationResult(latitude, longitude);
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    return json;
  }
}

class _LaunchResult extends MobileActionResult {
  bool launched;
  _LaunchResult(this.launched);

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json['launched'] = launched;
    return json;
  }
}

class _ImageResult extends MobileActionResult {
  String imageUrl;
  _ImageResult(this.imageUrl);

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json['imageUrl'] = imageUrl;
    return json;
  }
}

class _QrCodeResult extends MobileActionResult {
  String code;
  String format;
  _QrCodeResult(this.code, this.format);

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json['code'] = code;
    json['format'] = format;
    return json;
  }
}

class _LocationResult extends MobileActionResult {
  num latitude;
  num longitude;
  _LocationResult(this.latitude, this.longitude);

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json['latitude'] = latitude;
    json['longitude'] = longitude;
    return json;
  }
}

enum WidgetMobileActionType {
  takePictureFromGallery,
  takePhoto,
  mapDirection,
  mapLocation,
  scanQrCode,
  makePhoneCall,
  getLocation,
  takeScreenshot,
  unknown
}

WidgetMobileActionType widgetMobileActionTypeFromString(String value) {
  return WidgetMobileActionType.values.firstWhere(
      (e) => e.toString().split('.')[1].toUpperCase() == value.toUpperCase(),
      orElse: () => WidgetMobileActionType.unknown);
}

class WidgetActionHandler with HasTbContext {
  WidgetActionHandler(TbContext tbContext) {
    setTbContext(tbContext);
  }

  Future<Map<String, dynamic>> handleWidgetMobileAction(
      List<dynamic> args, InAppWebViewController controller) async {
    var result = await _handleWidgetMobileAction(args, controller);
    return result.toJson();
  }

  Future<WidgetMobileActionResult> _handleWidgetMobileAction(
      List<dynamic> args, InAppWebViewController controller) async {
    if (args.isNotEmpty && args[0] is String) {
      var actionType = widgetMobileActionTypeFromString(args[0]);
      switch (actionType) {
        case WidgetMobileActionType.takePictureFromGallery:
          return await _takePicture(ImageSource.gallery);
        case WidgetMobileActionType.takePhoto:
          return await _takePicture(ImageSource.camera);
        case WidgetMobileActionType.mapDirection:
          return await _launchMap(args, true);
        case WidgetMobileActionType.mapLocation:
          return await _launchMap(args, false);
        case WidgetMobileActionType.scanQrCode:
          return await _scanQrCode();
        case WidgetMobileActionType.makePhoneCall:
          return await _makePhoneCall(args);
        case WidgetMobileActionType.getLocation:
          return await _getLocation();
        case WidgetMobileActionType.takeScreenshot:
          return await _takeScreenshot(controller);
        case WidgetMobileActionType.unknown:
          return WidgetMobileActionResult.errorResult(
              'Unknown actionType: ${args[0]}');
      }
    } else {
      return WidgetMobileActionResult.errorResult(
          'actionType is not provided.');
    }
  }

  Future<WidgetMobileActionResult> _takePicture(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        var mimeType = lookupMimeType(pickedFile.path);
        if (mimeType != null) {
          var image = File(pickedFile.path);
          List<int> imageBytes = await image.readAsBytes();
          String imageUrl =
              UriData.fromBytes(imageBytes, mimeType: mimeType).toString();
          return WidgetMobileActionResult.successResult(
              MobileActionResult.image(imageUrl));
        } else {
          return WidgetMobileActionResult.errorResult(
              'Unknown picture mime type');
        }
      } else {
        return WidgetMobileActionResult.emptyResult();
      }
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<WidgetMobileActionResult> _launchMap(
      List<dynamic> args, bool directionElseLocation) async {
    try {
      num? lat;
      num? lon;
      if (args.length > 2 && args[1] is num && args[2] is num) {
        lat = args[1];
        lon = args[2];
      } else {
        return WidgetMobileActionResult.errorResult(
            'Missing target latitude or longitude arguments!');
      }
      var url = 'https://www.google.com/maps/';
      url += directionElseLocation
          ? 'dir/?api=1&destination=$lat,$lon'
          : 'search/?api=1&query=$lat,$lon';
      return WidgetMobileActionResult.successResult(await _tryLaunch(url));
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<WidgetMobileActionResult> _scanQrCode() async {
    try {
      Barcode? barcode = await tbContext.navigateTo('/qrCodeScan',
          transition: TransitionType.nativeModal);
      if (barcode != null && barcode.code != null) {
        return WidgetMobileActionResult.successResult(MobileActionResult.qrCode(
            barcode.code!, describeEnum(barcode.format)));
      } else {
        return WidgetMobileActionResult.emptyResult();
      }
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<WidgetMobileActionResult> _makePhoneCall(List<dynamic> args) async {
    try {
      var phoneNumber;
      if (args.length > 1 && args[1] != null) {
        phoneNumber = args[1];
      } else {
        return WidgetMobileActionResult.errorResult(
            'Missing or invalid phone number!');
      }
      return WidgetMobileActionResult.successResult(
          await _tryLaunch('tel://$phoneNumber'));
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<WidgetMobileActionResult> _getLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return WidgetMobileActionResult.errorResult(
            'Location services are disabled.');
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return WidgetMobileActionResult.errorResult(
              'Location permissions are denied.');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        return WidgetMobileActionResult.errorResult(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return WidgetMobileActionResult.successResult(
          MobileActionResult.location(position.latitude, position.longitude));
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<WidgetMobileActionResult> _takeScreenshot(
      InAppWebViewController controller) async {
    try {
      List<int>? imageBytes = await controller.takeScreenshot();
      if (imageBytes != null) {
        String imageUrl =
            UriData.fromBytes(imageBytes, mimeType: 'image/png').toString();
        return WidgetMobileActionResult.successResult(
            MobileActionResult.image(imageUrl));
      } else {
        return WidgetMobileActionResult.emptyResult();
      }
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<MobileActionResult> _tryLaunch(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
      return MobileActionResult.launched(true);
    } else {
      log.error('Could not launch $url');
      return MobileActionResult.launched(false);
    }
  }

  WidgetMobileActionResult _handleError(e) {
    String error;
    if (e is PlatformException) {
      error = e.message ?? e.code;
    } else {
      error = e.toString();
    }
    return WidgetMobileActionResult.errorResult(error);
  }
}
