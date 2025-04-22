import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/services/tb_client/i_tb_client_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

abstract class Utils {
  static const _tbImagePrefix = 'tb-image;';
  static const _imageBase64UrlPrefix = 'data:image/';
  static final _imagesUrlRegexp = RegExp('/api/images/(tenant|system)/(.*)');
  static final _noImageDataUri = UriData.parse(
    'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==',
  ).contentAsBytes();

  static const _authScheme = 'Bearer ';
  static const _authHeaderName = 'X-Authorization';

  static String createDashboardEntityState(
    EntityId? entityId, {
    String? entityName,
    String? entityLabel,
    String? stateId,
  }) {
    var stateObj = [
      <String, dynamic>{'params': <String, dynamic>{}},
    ];
    if (entityId != null) {
      stateObj[0]['params']['entityId'] = entityId.toJson();
    }
    if (entityName != null) {
      stateObj[0]['params']['entityName'] = entityName;
    }
    if (entityLabel != null) {
      stateObj[0]['params']['entityLabel'] = entityLabel;
    }
    if (stateId != null) {
      stateObj[0]['id'] = stateId;
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

  static Widget imageFromTbImage(
    BuildContext context,
    String? imageUrl, {
    Color? color,
    double? width,
    double? height,
    String? semanticLabel,
    Widget Function(BuildContext)? onError,
  }) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return _onErrorImage(
        context,
        color: color,
        width: width,
        height: height,
        semanticLabel: semanticLabel,
        onError: onError,
      );
    } else {
      imageUrl = _removeTbImagePrefix(imageUrl);
      if (_isImageResourceUrl(imageUrl)) {
        var jwtToken = getIt<ITbClientService>().getJwtToken();
        if (jwtToken == null) {
          return _onErrorImage(
            context,
            color: color,
            width: width,
            height: height,
            semanticLabel: semanticLabel,
            onError: onError,
          );
        }
        var parts = imageUrl.split('/');
        var key = parts[parts.length - 1];
        parts[parts.length - 1] = Uri.encodeComponent(key);
        var encodedUrl = parts.join('/');
        var imageLink =
            getIt<IEndpointService>().getCachedEndpoint() + encodedUrl;

        return _networkImage(
          context,
          imageLink,
          headers: {_authHeaderName: _authScheme + jwtToken},
          color: color,
          width: width,
          height: height,
          semanticLabel: semanticLabel,
          onError: onError,
        );
      } else if (_isBase64DataImageUrl(imageUrl)) {
        return _imageFromBase64(
          context,
          imageUrl,
          color: color,
          width: width,
          height: height,
          semanticLabel: semanticLabel,
          onError: onError,
        );
      } else if (_isValidUrl(imageUrl)) {
        return _networkImage(
          context,
          imageUrl,
          color: color,
          width: width,
          height: height,
          semanticLabel: semanticLabel,
          onError: onError,
        );
      } else {
        return _onErrorImage(
          context,
          color: color,
          width: width,
          height: height,
          semanticLabel: semanticLabel,
          onError: onError,
        );
      }
    }
  }

  static Widget _networkImage(
    BuildContext context,
    String imageUrl, {
    Map<String, String>? headers,
    Color? color,
    double? width,
    double? height,
    String? semanticLabel,
    Widget Function(BuildContext)? onError,
  }) {
    return Image.network(
      imageUrl,
      headers: headers,
      color: color,
      width: width,
      height: height,
      semanticLabel: semanticLabel,
      errorBuilder: (context, error, stackTrace) => _svgImageFromUrl(
        context,
        imageUrl,
        headers: headers,
        width: width,
        height: height,
        semanticLabel: semanticLabel,
        onError: onError,
      ),
    );
  }

  static Widget _imageFromBase64(
    BuildContext context,
    String base64, {
    Color? color,
    double? width,
    double? height,
    String? semanticLabel,
    Widget Function(BuildContext)? onError,
  }) {
    var uriData = UriData.parse(base64);
    if (uriData.mimeType == 'image/svg+xml') {
      return _svgImageFromUrl(
        context,
        base64,
        color: color,
        width: width,
        height: height,
        semanticLabel: semanticLabel,
        onError: onError,
      );
    } else {
      return Image.memory(
        uriData.contentAsBytes(),
        color: color,
        width: width,
        height: height,
        semanticLabel: semanticLabel,
        errorBuilder: (context, error, stackTrace) => _onErrorImage(
          context,
          color: color,
          width: width,
          height: height,
          semanticLabel: semanticLabel,
          onError: onError,
        ),
      );
    }
  }

  static Widget _svgImageFromUrl(
    BuildContext context,
    String imageUrl, {
    Map<String, String>? headers,
    Color? color,
    double? width,
    double? height,
    String? semanticLabel,
    Widget Function(BuildContext)? onError,
  }) {
    Widget image = ScalableImageWidget.fromSISource(
      si: ScalableImageSource.fromSvgHttpUrl(
        Uri.parse(imageUrl),
        httpHeaders: headers,
      ),
      onError: (context) => _onErrorImage(
        context,
        color: color,
        width: width,
        height: height,
        semanticLabel: semanticLabel,
        onError: onError,
      ),
    );
    if (color != null) {
      var colorFilter = ColorFilter.mode(color, BlendMode.srcIn);
      image = ColorFiltered(
        colorFilter: colorFilter,
        child: image,
      );
    }
    if (height != null || width != null) {
      image = SizedBox(
        width: width,
        height: height,
        child: image,
      );
    }
    return image;
  }

  static Widget _onErrorImage(
    BuildContext context, {
    Color? color,
    double? width,
    double? height,
    String? semanticLabel,
    Widget Function(BuildContext)? onError,
  }) {
    return onError != null
        ? onError(context)
        : _emptyImage(
            color: color,
            width: width,
            height: height,
            semanticLabel: semanticLabel,
          );
  }

  static Widget _emptyImage({
    Color? color,
    double? width,
    double? height,
    String? semanticLabel,
  }) {
    return Image.memory(
      _noImageDataUri,
      color: color,
      width: width,
      height: height,
      semanticLabel: semanticLabel,
    );
  }

  static String _removeTbImagePrefix(String url) {
    return url.replaceFirst(_tbImagePrefix, '');
  }

  static bool _isImageResourceUrl(String url) {
    return _imagesUrlRegexp.hasMatch(url);
  }

  static bool _isValidUrl(String url) {
    return Uri.tryParse(url) != null;
  }

  static bool _isBase64DataImageUrl(String url) {
    return url.startsWith(_imageBase64UrlPrefix);
  }
}
