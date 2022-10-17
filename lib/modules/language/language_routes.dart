import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';

import 'language_page.dart';

class LanguageRoutes extends TbRoutes {
  late var languageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return LanguagePage(tbContext);
  });

  LanguageRoutes(TbContext tbContext) : super(tbContext);

  @override
  void doRegisterRoutes(router) {
    router.define("/language", handler: languageHandler);
  }
}
