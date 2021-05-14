import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import 'assets_base.dart';

class AssetsList extends BaseEntitiesPageLinkWidget<AssetInfo> with AssetsBase, EntitiesListStateBase {

  AssetsList(TbContext tbContext) : super(tbContext);

}

