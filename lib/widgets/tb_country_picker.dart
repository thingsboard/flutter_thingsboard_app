// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_selector/flutter_country_selector.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/widgets/tb_bottom_sheet_builder.dart';

/// Country names from flutter_country_selector, the data the phone field
/// uses, for every app language: English where it has no translation
/// (Danish), Bokmål for Norwegian.
class CountryNamesDelegate
    extends LocalizationsDelegate<CountrySelectorLocalization> {
  const CountryNamesDelegate();

  static const _names = CountrySelectorLocalization.delegate;

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CountrySelectorLocalization> load(Locale locale) {
    final names = locale.languageCode == 'no' ? const Locale('nb') : locale;
    return _names.isSupported(names)
        ? _names.load(names)
        : SynchronousFuture(CountrySelectorLocalizationEn());
  }

  @override
  bool shouldReload(CountryNamesDelegate old) => false;
}

CountrySelectorLocalization _localization(BuildContext context) =>
    CountrySelectorLocalization.of(context) ?? CountrySelectorLocalizationEn();

String _flag(IsoCode isoCode) =>
    String.fromCharCodes(isoCode.name.codeUnits.map((c) => 0x1F1E6 + c - 0x41));

/// The flag and name of a country, for a selected value.
String countryDisplayName(BuildContext context, IsoCode? isoCode) =>
    isoCode == null
    ? ''
    : '${_flag(isoCode)} ${_localization(context).countryName(isoCode)}';

class TbCountryPicker extends StatelessWidget {
  const TbCountryPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = _localization(context);
    final countries = IsoCode.values.toList()
      ..sort(
        (a, b) =>
            localization.countryName(a).compareTo(localization.countryName(b)),
      );
    return TbBottomSheetBuilder<IsoCode>(
      shrinkWrap: false,
      title: S.of(context).selectCountry,
      allItems: countries,
      searchFunction: (input, isoCode) =>
          localization.countryName(isoCode).toLowerCase().contains(input),
      listTitleBuilder: (context, isoCode) =>
          '${_flag(isoCode)} ${localization.countryName(isoCode)} '
          '+${localization.countryDialCode(isoCode)}',
    );
  }
}
