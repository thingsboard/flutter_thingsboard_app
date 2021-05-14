import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

import 'assets_list.dart';

class AssetsPage extends TbPageWidget<AssetsPage, _AssetsPageState> {

  AssetsPage(TbContext tbContext) : super(tbContext);

  @override
  _AssetsPageState createState() => _AssetsPageState();

}

class _AssetsPageState extends TbPageState<AssetsPage, _AssetsPageState> {

  @override
  Widget build(BuildContext context) {
    var assetsList = AssetsList(tbContext);
    return Scaffold(
        appBar: TbAppBar(
            tbContext,
            title: Text(assetsList.title)
        ),
        body: assetsList
    );
  }

}
