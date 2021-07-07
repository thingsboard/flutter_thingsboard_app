import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

import 'tb_theme_utils.dart';

typedef WlThemedWidgetBuilder = Widget Function(BuildContext context, ThemeData data, WhiteLabelingParams wlParams);

class WlThemeWidget extends TbContextWidget<WlThemeWidget, _WlThemeWidgetState> {

  final WlThemedWidgetBuilder wlThemedWidgetBuilder;

  WlThemeWidget(TbContext tbContext, {required this.wlThemedWidgetBuilder}) : super(tbContext);

  @override
  _WlThemeWidgetState createState() => _WlThemeWidgetState();

  static _WlThemeWidgetState? of(BuildContext context) {
    return context.findAncestorStateOfType<_WlThemeWidgetState>();
  }

}

class _WlThemeWidgetState extends TbContextState<WlThemeWidget, _WlThemeWidgetState> {

  late ThemeData _themeData;
  WhiteLabelingParams _wlParams = WhiteLabelingParams();

  @override
  void initState() {
    super.initState();
    _loadThemeData();
  }

  void _loadThemeData() {
    _themeData = TbThemeUtils.createTheme(_wlParams.paletteSettings);
    if (mounted) {
      setState(() {});
    }
  }

  void setWlParams(WhiteLabelingParams wlParams) {
    setState(() {
      _themeData = TbThemeUtils.createTheme(wlParams.paletteSettings);
      _wlParams = wlParams;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.wlThemedWidgetBuilder(context, _themeData, _wlParams);
  }

}
