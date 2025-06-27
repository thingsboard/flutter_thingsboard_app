import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/entity/entities_list_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/asset/assets_base.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class AssetsListWidget extends EntitiesListPageLinkWidget<AssetInfo>
    with AssetsBase {
  AssetsListWidget(
    super.tbContext, {
    super.key,
    super.controller,
  });

  @override
  void onViewAll() {
    getIt<ThingsboardAppRouter>().navigateTo('/assets');
  }
}
