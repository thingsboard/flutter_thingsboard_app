import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/profile/widget/tb_bottom_sheet_builder.dart';

class TbCountryPicker extends HookWidget {
  const TbCountryPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final service = useMemoized(() => CountryService());
    final allCountries = useMemoized(() => service.getAll());
    return TbBottomSheetBuilder<Country>(
      shrinkWrap: false,
      title: S.of(context).selectCountry,
      allItems: allCountries,
      searchFunction:
          (input, country) => country.displayName.toLowerCase().contains(input),
      listTitleBuilder:
          (context, country) =>
              '${country.flagEmoji} ${country.name} +${country.phoneCode}',
    );
  }
}
