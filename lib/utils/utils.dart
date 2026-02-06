import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/actions/url_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/results/launch_result.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';

abstract class Utils {
  static const _tbImagePrefix = 'tb-image;';
  static const _imageBase64UrlPrefix = 'data:image/';
  static final _imagesUrlRegexp = RegExp('/api/images/(tenant|system)/(.*)');
  static final _noImageDataUri =
      UriData.parse(
        'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==',
      ).contentAsBytes();

  static const _authScheme = 'Bearer ';
  static const _authHeaderName = 'X-Authorization';
  static Future<bool> onWebViewLinkPressed(String link) async {
    final LaunchResult result = await UrlAction.tryLaunch(link);
    if (!result.launched) {
      getIt<IOverlayService>().showErrorNotification(
        (context) => S.of(context).cantLaunchUrlLink(link),
      );
    }
    return true;
  }

  static String createDashboardEntityState(
    EntityId? entityId, {
    String? entityName,
    String? entityLabel,
    String? stateId,
  }) {
    final List<Map<String, dynamic>> stateObj = [{}];
    final params = <String, dynamic>{};
    if (entityId != null) {
      params['entityId'] = entityId.toJson();
    }
    if (entityName != null) {
      params['entityName'] = entityName;
    }
    if (entityLabel != null) {
      params['entityLabel'] = entityLabel;
    }
    if (stateId != null) {
      stateObj[0]['id'] = stateId;
    }
    stateObj[0]['params'] = params;
    final stateJson = json.encode(stateObj);
    var encodedUri = Uri.encodeComponent(stateJson);
    encodedUri = encodedUri.replaceAllMapped(RegExp('%([0-9A-F]{2})'), (match) {
      final p1 = match.group(1)!;
      return String.fromCharCode(int.parse(p1, radix: 16));
    });
    return Uri.encodeComponent(base64.encode(utf8.encode(encodedUri)));
  }

  static String? contactToShortAddress(ContactBased contact) {
    final addressParts = <String>[];
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
    ThingsboardClient tbClient,
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
      final newImageUrl = _removeTbImagePrefix(imageUrl);
      if (_isImageResourceUrl(newImageUrl)) {
        final jwtToken = tbClient.getJwtToken();
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
        final parts = newImageUrl.split('/');
        final key = parts[parts.length - 1];
        parts[parts.length - 1] = Uri.encodeComponent(key);
        final encodedUrl = parts.join('/');
        final imageLink =
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
      errorBuilder:
          (context, error, stackTrace) => _svgImageFromUrl(
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
    final uriData = UriData.parse(base64);
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
        errorBuilder:
            (context, error, stackTrace) => _onErrorImage(
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
      onError:
          (context) => _onErrorImage(
            context,
            color: color,
            width: width,
            height: height,
            semanticLabel: semanticLabel,
            onError: onError,
          ),
    );
    if (color != null) {
      final colorFilter = ColorFilter.mode(color, BlendMode.srcIn);
      image = ColorFiltered(colorFilter: colorFilter, child: image);
    }
    if (height != null || width != null) {
      image = SizedBox(width: width, height: height, child: image);
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

  static double degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }

  static bool _isBase64DataImageUrl(String url) {
    return url.startsWith(_imageBase64UrlPrefix);
  }

  static bool isConnectionError(dynamic e) {
    return e is ThingsboardError &&
        e.errorCode == ThingsBoardErrorCode.general &&
        e.message == 'Unable to connect';
  }

  static ColorFilter toColorFilter(Color color) {
    return ColorFilter.mode(color, BlendMode.srcIn);
  }
}
