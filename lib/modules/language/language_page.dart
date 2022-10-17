import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/utils/services/tb_app_storage.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';
import 'package:intl/intl.dart';

import '../../generated/l10n.dart';

class LanguagePage extends TbPageWidget {
  LanguagePage(TbContext tbContext, {Key? key}) : super(tbContext, key: key);

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends TbPageState<LanguagePage> {
  final _isLoadingNotifier = ValueNotifier<bool>(true);

  String _localeCode = 'auto';

  @override
  void initState() {
    super.initState();
    _loadLocaleCode();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var radioListTiles = <Widget>[];
    radioListTiles.add(RadioListTile<String>(
      activeColor: const Color(0xFF3471FF),
      title: Text(S.of(context).language_auto_title),
      subtitle: Text(S.of(context).language_auto_subtitle),
      value: 'auto',
      groupValue: _localeCode,
      onChanged: (String? codes) {
        setState(() {
          _localeCode = 'auto';
        });
      },
      controlAffinity: ListTileControlAffinity.trailing,
    ));
    var supportedLocales = S.delegate.supportedLocales;
    var nativeLocaleNames = LocaleNamesLocalizationsDelegate.nativeLocaleNames;
    for (var locale in supportedLocales) {
      var nativeLocaleCode = locale.toString();
      var nativeLocaleName = nativeLocaleNames[nativeLocaleCode];
      if (nativeLocaleName == null) continue;
      var languageName = nativeLocaleName.replaceAll(RegExp(r'\s*\(.*\)\s*'), '');
      var countryName = RegExp(r'(?<=\()(.+?)(?=\))').stringMatch(nativeLocaleName);
      radioListTiles.add(
        RadioListTile<String>(
          activeColor: const Color(0xFF3471FF),
          title: Text(languageName),
          subtitle: countryName != null ? Text(countryName) : null,
          value: nativeLocaleCode,
          groupValue: _localeCode,
          onChanged: (String? code) {
            setState(() {
              _localeCode = code ?? 'auto';
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TbAppBar(
        tbContext,
        title: Text(S.of(context).language_title),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              _saveLocaleCode();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(children: radioListTiles),
          ValueListenableBuilder<bool>(
            valueListenable: _isLoadingNotifier,
            builder: (BuildContext context, bool loading, child) {
              if (loading) {
                return SizedBox.expand(
                  child: Container(
                    color: const Color(0x99FFFFFF),
                    child: const Center(child: TbProgressIndicator(size: 50.0)),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          )
        ],
      ),
    );
  }

  Future<void> _loadLocaleCode() async {
    var storage = createAppStorage();
    _isLoadingNotifier.value = true;
    var localeCode = await storage.getItem('localeCode');
    setState(() {
      _localeCode = localeCode ?? 'auto';
    });
    _isLoadingNotifier.value = false;
  }

  Future<void> _saveLocaleCode() async {
    var storage = createAppStorage();
    _isLoadingNotifier.value = true;
    List<String> codes;
    if (_localeCode == 'auto') {
      codes = Intl.systemLocale.split('_');
      await storage.deleteItem('localeCode');
    } else {
      codes = _localeCode.split('_');
      await storage.setItem('localeCode', _localeCode);
    }
    if (codes.length == 2) {
      S.load(Locale.fromSubtags(languageCode: codes[0], countryCode: codes[1]));
    } else {
      S.load(Locale.fromSubtags(languageCode: codes[0]));
    }
    _isLoadingNotifier.value = false;
    navigateTo('/', replace: true, clearStack: true);
  }
}
