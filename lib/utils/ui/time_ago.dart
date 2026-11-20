// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:timeago/timeago.dart' as timeago;

/// [time] relative to now ("5 minutes ago", or "5m" when [short]) in the
/// app's language, or in English for one timeago has no messages for:
/// Georgian (ka), Lithuanian (lt) and Slovenian (sl) as of timeago 3.7.1.
/// A new app language needs a case here; time_ago_test checks every one.
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
      'ca' => short ? timeago.CaShortMessages() : timeago.CaMessages(),
      'cs' => short ? timeago.CsShortMessages() : timeago.CsMessages(),
      'da' => short ? timeago.DaShortMessages() : timeago.DaMessages(),
      'de' => short ? timeago.DeShortMessages() : timeago.DeMessages(),
      'el' => short ? timeago.GrShortMessages() : timeago.GrMessages(),
      'es' => short ? timeago.EsShortMessages() : timeago.EsMessages(),
      'fr' => short ? timeago.FrShortMessages() : timeago.FrMessages(),
      'hi' => short ? timeago.HiShortMessages() : timeago.HiMessages(),
      'it' => short ? timeago.ItShortMessages() : timeago.ItMessages(),
      // Japanese, Korean and Polish have no short form.
      'ja' => timeago.JaMessages(),
      'ko' => timeago.KoMessages(),
      'lv' => short ? timeago.LvShortMessages() : timeago.LvMessages(),
      'nl' => short ? timeago.NlShortMessages() : timeago.NlMessages(),
      'no' => short ? timeago.NbNoShortMessages() : timeago.NbNoMessages(),
      'pl' => timeago.PlMessages(),
      // The app's Portuguese is Brazilian.
      'pt' => short ? timeago.PtBrShortMessages() : timeago.PtBrMessages(),
      'ro' => short ? timeago.RoShortMessages() : timeago.RoMessages(),
      'tr' => short ? timeago.TrShortMessages() : timeago.TrMessages(),
      'uk' => short ? timeago.UkShortMessages() : timeago.UkMessages(),
      'vi' => short ? timeago.ViShortMessages() : timeago.ViMessages(),
      // Chinese has no short form; the plain `zh` translation is Simplified.
      'zh' => switch (locale.countryCode) {
        'TW' => timeago.ZhMessages(),
        _ => timeago.ZhCnMessages(),
      },
      _ => null,
    };
