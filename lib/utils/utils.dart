import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../constants/app_constants.dart';

abstract class Utils {

  static const _tbImagePrefix = 'tb-image;';
  static const _imageBase64UrlPrefix = 'data:image/';
  static final _imagesUrlRegexp = RegExp('\/api\/images\/(tenant|system)\/(.*)');
  static final _noImageDataUri = UriData.parse('data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==').contentAsBytes();

  static const _authScheme = 'Bearer ';
  static const _authHeaderName = 'X-Authorization';

  static String createDashboardEntityState(EntityId entityId,
      {String? entityName, String? entityLabel}) {
    var stateObj = [
      <String, dynamic>{
        'params': <String, dynamic>{'entityId': entityId.toJson()}
      }
    ];
    if (entityName != null) {
      stateObj[0]['params']['entityName'] = entityName;
    }
    if (entityLabel != null) {
      stateObj[0]['params']['entityLabel'] = entityLabel;
    }
    var stateJson = json.encode(stateObj);
    var encodedUri = Uri.encodeComponent(stateJson);
    encodedUri =
        encodedUri.replaceAllMapped(RegExp(r'%([0-9A-F]{2})'), (match) {
      var p1 = match.group(1)!;
      return String.fromCharCode(int.parse(p1, radix: 16));
    });
    return Uri.encodeComponent(base64.encode(utf8.encode(encodedUri)));
  }

  static String? contactToShortAddress(ContactBased contact) {
    var addressParts = <String>[];
    if (contact.country != null) {
      addressParts.add(contact.country!);
    }
    if (contact.city != null) {
      addressParts.add(contact.city!);
    }
    if (contact.address != null) {
      addressParts.add(contact.address!);
    }
    if (addressParts.isNotEmpty) {
      return addressParts.join(', ');
    } else {
      return null;
    }
  }

  static Widget imageFromTbImage(ThingsboardClient tbClient,
      String? imageUrl,
      {Color? color, double? width, double? height, String? semanticLabel}) {
    var jwtToken = tbClient.getJwtToken();
    if (imageUrl == null || imageUrl.isEmpty || jwtToken == null) {
      return Image.memory(_noImageDataUri,
          color: color,
          width: width,
          height: height,
          semanticLabel: semanticLabel);
    } else {
      imageUrl = _removeTbImagePrefix(imageUrl);
      if (_isImageResourceUrl(imageUrl)) {
        var parts = imageUrl.split('/');
        var key = parts[parts.length - 1];
        parts[parts.length - 1] = Uri.encodeComponent(key);
        var encodedUrl = parts.join('/');
        var imageLink = ThingsboardAppConstants.thingsBoardApiEndpoint + encodedUrl;
        return Image.network(imageLink,
            headers: {
              _authHeaderName: _authScheme + jwtToken
            },
            color: color,
            width: width,
            height: height,
            semanticLabel: semanticLabel,
            errorBuilder: (context, error, stackTrace) =>
                SvgPicture.network(
                  imageLink,
                  headers: {
                    _authHeaderName: _authScheme + jwtToken
                  },
                  colorFilter: color != null ? ColorFilter.mode(
                      color, BlendMode.srcIn
                  ) : null,
                  width: width,
                  height: height,
                  semanticsLabel: semanticLabel
                )
        );
      } else if (_isBase64DataImageUrl(imageUrl)) {
        return _imageFromBase64(imageUrl,
            color: color,
            width: width,
            height: height,
            semanticLabel: semanticLabel);
      } else {
        return Image.network(imageUrl,
            color: color,
            width: width,
            height: height,
            semanticLabel: semanticLabel);
      }
    }
  }


  static Widget _imageFromBase64(String base64,
      {Color? color, double? width, double? height, String? semanticLabel}) {
    var uriData = UriData.parse(base64);
    if (uriData.mimeType == 'image/svg+xml') {
      ColorFilter? colorFilter;
      if (color != null) {
        colorFilter = ColorFilter.mode(color, BlendMode.srcIn);
      }
      return SvgPicture.memory(uriData.contentAsBytes(),
          colorFilter: colorFilter,
          width: width,
          height: height,
          semanticsLabel: semanticLabel);
    } else {
      return Image.memory(uriData.contentAsBytes(),
          color: color,
          width: width,
          height: height,
          semanticLabel: semanticLabel);
    }
  }

  static String _removeTbImagePrefix(String url) {
    return url.replaceFirst(_tbImagePrefix, '');
  }

  static bool _isImageResourceUrl(String url) {
    return _imagesUrlRegexp.hasMatch(url);
  }

  static bool _isBase64DataImageUrl (String url) {
    return url.startsWith(_imageBase64UrlPrefix);
  }
}
