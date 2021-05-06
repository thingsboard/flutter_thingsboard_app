import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_page.dart';
import 'package:thingsboard_app/modules/asset/assets_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class AssetsPage extends EntitiesPage<AssetInfo> with AssetsBase {

  AssetsPage(TbContext tbContext) : super(tbContext);

  @override
  String get noMoreItemsText => 'No more assets';

  @override
  String get searchHint => 'Search assets';

}
