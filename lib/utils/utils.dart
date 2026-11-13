// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';
import 'package:url_launcher/url_launcher_string.dart';

abstract class Utils {
  static const _tbImagePrefix = 'tb-image;';
  static const _imageBase64UrlPrefix = 'data:image/';
  // Anchored: only a path on the server is a server image.
  static final _imagesUrlRegexp = RegExp('^/api/images/(tenant|system)/.+');
  static final _noImageDataUri = UriData.parse(
    'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==',
  ).contentAsBytes();

  static const _authScheme = 'Bearer ';
  static const _authHeaderName = 'X-Authorization';

  /// For links in server text: release notes, terms, privacy policy.
  static const _linkSchemes = {'https', 'http', 'mailto', 'tel'};

  static const _storeLinkSchemes = {'https', 'market', 'itms-apps'};

  static Future<bool> onWebViewLinkPressed(String link) async {
    if (_hasScheme(link, _linkSchemes) && await canLaunchUrlString(link)) {
      await launchUrlString(link);
    } else {
      _cantOpen(link);
    }
    return true;
  }

  /// Opens a store link from the server outside the app. Not checked with
  /// `canLaunchUrlString`: Android answers it only for schemes the manifest
  /// declares, and `market:` is not one of them.
  static Future<void> openStoreLink(String link) async {
    if (!_hasScheme(link, _storeLinkSchemes)) {
      _cantOpen(link);
      return;
    }
    await launchUrlString(link, mode: LaunchMode.externalApplication);
  }

  static Future<bool> openReleaseNotesLink(String link) async {
    if (_hasScheme(link, _linkSchemes)) {
      await launchUrlString(link, mode: LaunchMode.externalApplication);
    } else {
      _cantOpen(link);
    }
    return true;
  }

  static bool _hasScheme(String link, Set<String> schemes) {
    final scheme = Uri.tryParse(link.trim())?.scheme.toLowerCase();
    return scheme != null && schemes.contains(scheme);
  }

  static void _cantOpen(String link) {
    getIt<IOverlayService>().showErrorNotification(
      (context) => S.of(context).cantLaunchUrlLink(link),
    );
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
      params['entityId'] = {
        'entityType': entityId.entityType.name,
        'id': entityId.id,
      };
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

  static Widget imageFromTbImage(
    BuildContext context,
    ThingsboardClient tbClient,
    String? imageUrl, {
    Color? color,
    double? width,
    double? height,
    String? semanticLabel,
    bool? loginLogo,
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
      final resolvedImageUrl = _removeTbImagePrefix(imageUrl);
      if (_isImageResourceUrl(resolvedImageUrl)) {
        final parts = resolvedImageUrl.split('/');
        final key = Uri.encodeComponent(parts[parts.length - 1]);
        String imageLink;
        Map<String, String>? headers;
        if (loginLogo != null && loginLogo) {
          final type = parts[parts.length - 2];
          imageLink =
              '${getIt<IEndpointService>().getCachedEndpoint()}/api/noauth/whiteLabel/loginLogo/$type/$key';
        } else {
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
          parts[parts.length - 1] = key;
          final encodedUrl = parts.join('/');
          // The endpoint of the client whose token is sent, also mid-switch.
          imageLink = tbClient.apiEndpoint + encodedUrl;
          headers = {_authHeaderName: _authScheme + jwtToken};
        }
        return _networkImage(
          context,
          imageLink,
          headers: headers,
          color: color,
          width: width,
          height: height,
          semanticLabel: semanticLabel,
          onError: onError,
        );
      } else if (_isBase64DataImageUrl(resolvedImageUrl)) {
        return _imageFromBase64(
          context,
          resolvedImageUrl,
          color: color,
          width: width,
          height: height,
          semanticLabel: semanticLabel,
          onError: onError,
        );
      } else {
        final imageLink = _resolveNetworkImageLink(resolvedImageUrl);
        if (imageLink == null) {
          return _onErrorImage(
            context,
            color: color,
            width: width,
            height: height,
            semanticLabel: semanticLabel,
            onError: onError,
          );
        }
        return _networkImage(
          context,
          imageLink,
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
    // Tried as a raster image first, an SVG would be downloaded twice.
    if (Uri.tryParse(imageUrl)?.path.toLowerCase().endsWith('.svg') ?? false) {
      return _svgImageFromUrl(
        context,
        imageUrl,
        headers: headers,
        width: width,
        height: height,
        semanticLabel: semanticLabel,
        onError: onError,
      );
    }
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
    return url.startsWith(_tbImagePrefix)
        ? url.substring(_tbImagePrefix.length)
        : url;
  }

  static bool _isImageResourceUrl(String url) {
    return _imagesUrlRegexp.hasMatch(url);
  }

  /// HTTP(S) links are fetched as they are. Root-relative links, such as an
  /// image public link, are resolved against the active endpoint. Anything
  /// else has no meaningful target and is rendered as a missing image.
  static String? _resolveNetworkImageLink(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) {
      return null;
    }
    if (uri.scheme == 'http' || uri.scheme == 'https') {
      return url;
    }
    if (!uri.hasScheme && url.startsWith('/')) {
      return getIt<IEndpointService>().getCachedEndpoint() + url;
    }
    return null;
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
