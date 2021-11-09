import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/asset/assets_page.dart';

import 'asset_details_page.dart';

class AssetRoutes extends TbRoutes {
  late var assetsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    var searchMode = params['search']?.first == 'true';
    return AssetsPage(tbContext, searchMode: searchMode);
  });

  late var assetDetailsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return AssetDetailsPage(tbContext, params["id"][0]);
  });

  AssetRoutes(TbContext tbContext) : super(tbContext);

  @override
  void doRegisterRoutes(router) {
    router.define("/assets", handler: assetsHandler);
    router.define("/asset/:id", handler: assetDetailsHandler);
  }
}
