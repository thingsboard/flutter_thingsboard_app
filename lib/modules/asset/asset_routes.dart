import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/tb_routes.dart';
import 'package:thingsboard_app/modules/asset/asset_details_page.dart';
import 'package:thingsboard_app/modules/asset/assets_page.dart';
class AssetRoutes extends TbRoutes {
  AssetRoutes(super.tbContext);
  late final assetsHandler = Handler(
    handlerFunc: ( context,  params) {
      final searchParams = params['search'] as List?;
      final searchMode = searchParams?.firstOrNull == 'true';
      return AssetsPage(tbContext, searchMode: searchMode);
    },
  );

  late Handler assetDetailsHandler = Handler(
    handlerFunc: (BuildContext? context, params) {
 
      return AssetDetailsPage(tbContext, params['id']!.first);
    },
  );

  @override
  void doRegisterRoutes(FluroRouter router) {
    router.define('/assets', handler: assetsHandler);
    router.define('/asset/:id', handler: assetDetailsHandler);
  }
}
