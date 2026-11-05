// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/custom_translation/i_custom_translation_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

class TbCustomTranslationService implements ICustomTranslationService {
  static final _i18nRegExp = RegExp(r'\{i18n:([^{}]+)\}');

  Map<String, dynamic> _translations = const {};

  @override
  Future<void> load({String? localeCode}) async {
    final code = (localeCode == null || localeCode.isEmpty) ? 'en_US' : localeCode;
    try {
      final response = await getIt<ITbClientService>()
          .client
          .get<Map<String, dynamic>>('/api/translation/full/$code');
      _translations = response.data ?? const {};
    } catch (e) {
      getIt<TbLogger>().debug('Failed to load custom translations: $e');
      _translations = const {};
    }
  }

  @override
  String translate(String? value) {
    if (value == null || value.isEmpty) {
      return value ?? '';
    }
    if (!value.contains('{i18n:')) {
      return value;
    }
    return value.replaceAllMapped(_i18nRegExp, (match) {
      final key = match.group(1);
      if (key == null || key.isEmpty) {
        return match.group(0)!;
      }
      final translated = _lookup(key);
      return translated ?? match.group(0)!;
    });
  }

  @override
  void clear() {
    _translations = const {};
  }

  /// Accumulates dotted segments on a miss, like ngx-translate's `getValue`:
  /// PATCH `/translation/custom` expands `a.b` into nested maps, while the
  /// advanced editor and file upload store the dotted key verbatim.
  String? _lookup(String key) {
    dynamic current = _translations;
    String? pending;
    final parts = key.split('.');
    for (var i = 0; i < parts.length; i++) {
      pending = pending == null ? parts[i] : '$pending.${parts[i]}';
      final isLast = i == parts.length - 1;
      final next = current is Map<String, dynamic> ? current[pending] : null;
      if (next is Map<String, dynamic> || (isLast && next != null)) {
        current = next;
        pending = null;
      }
    }
    return pending == null && current is String ? current : null;
  }
}
