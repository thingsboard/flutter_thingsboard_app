// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:timeago/timeago.dart' as timeago;

/// [time] relative to now ("5 minutes ago", or "5m" when [short]) in the
/// app's language, or in English for one timeago has no messages for.
String timeAgo(BuildContext context, DateTime time, {bool short = false}) {
  final locale = Localizations.localeOf(context);
  final messages = _messages(locale, short);
  if (messages == null) {
    return timeago.format(time, locale: short ? 'en_short' : 'en');
  }
  final key = '${locale.toLanguageTag()}${short ? '_short' : ''}';
  timeago.setLocaleMessages(key, messages);
  return timeago.format(time, locale: key);
}

timeago.LookupMessages? _messages(Locale locale, bool short) =>
    switch (locale.languageCode) {
      'ar' => short ? timeago.ArShortMessages() : timeago.ArMessages(),
      'da' => short ? timeago.DaShortMessages() : timeago.DaMessages(),
      'de' => short ? timeago.DeShortMessages() : timeago.DeMessages(),
      'el' => short ? timeago.GrShortMessages() : timeago.GrMessages(),
      'es' => short ? timeago.EsShortMessages() : timeago.EsMessages(),
      'fr' => short ? timeago.FrShortMessages() : timeago.FrMessages(),
      'it' => short ? timeago.ItShortMessages() : timeago.ItMessages(),
      'nl' => short ? timeago.NlShortMessages() : timeago.NlMessages(),
      'no' => short ? timeago.NbNoShortMessages() : timeago.NbNoMessages(),
      'vi' => short ? timeago.ViShortMessages() : timeago.ViMessages(),
      // Chinese has no short form; the plain `zh` translation is English.
      'zh' => switch (locale.countryCode) {
        'CN' => timeago.ZhCnMessages(),
        'TW' => timeago.ZhMessages(),
        _ => null,
      },
      _ => null,
    };
